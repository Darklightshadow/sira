import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/visite_repository_impl.dart';
import '../network/network_checker.dart';

class SyncManager {
  final VisiteRepositoryImpl _visiteRepository;
  final NetworkChecker _networkChecker;
  bool _syncEnCours = false;

  SyncManager({
    required VisiteRepositoryImpl visiteRepository,
    required NetworkChecker networkChecker,
  })  : _visiteRepository = visiteRepository,
        _networkChecker = networkChecker;

  // Appelé au démarrage de l'app et à chaque reconnexion réseau
  void demarrerEcoute() {
    _networkChecker.connectiviteStream.listen((estConnecte) async {
      if (estConnecte && !_syncEnCours) {
        await synchroniser();
      }
    });
  }

  Future<void> synchroniser() async {
    if (_syncEnCours) return;

    final estConnecte = await _networkChecker.estConnecte();
    if (!estConnecte) return;

    _syncEnCours = true;
    try {
      await _visiteRepository.synchroniserVisites();
    } finally {
      // finally garantit que _syncEnCours repasse à false
      // même si synchroniserVisites() lève une exception
      _syncEnCours = false;
    }
  }
}
