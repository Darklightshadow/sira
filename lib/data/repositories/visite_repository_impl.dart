import '../../domain/entities/visite_entity.dart';
import '../../domain/repositories/visite_repository.dart';
import '../datasources/remote/visite_remote_source.dart';
import '../datasources/local/visite_local_source.dart';
import '../models/visite_model.dart';
import '../../core/network/network_checker.dart';

class VisiteRepositoryImpl implements VisiteRepository {
  final VisiteRemoteSource _remoteSource;
  final VisiteLocalSource _localSource;
  final NetworkChecker _networkChecker;

  VisiteRepositoryImpl({
    required VisiteRemoteSource remoteSource,
    required VisiteLocalSource localSource,
    required NetworkChecker networkChecker,
  })  : _remoteSource = remoteSource,
        _localSource = localSource,
        _networkChecker = networkChecker;

  @override
  Future<VisiteEntity> enregistrerVisite(VisiteEntity visite) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final model = await _remoteSource.enregistrerVisite(
          _visiteToModelPending(visite).toJson(),
        );
        await _localSource.sauvegarderVisite(model);
        return model.toEntity();
      } catch (_) {
        final model = _visiteToModelPending(visite);
        await _localSource.sauvegarderVisite(model);
        return model.toEntity();
      }
    } else {
      final model = _visiteToModelPending(visite);
      await _localSource.sauvegarderVisite(model);
      return model.toEntity();
    }
  }

  @override
  Future<List<VisiteEntity>> getVisitesEnAttente() async {
    final models = await _localSource.getVisitesPending();
    return models.map((v) => v.toEntity()).toList();
  }

  @override
  Future<void> synchroniserVisites() async {
    final estEnLigne = await _networkChecker.estConnecte();
    if (!estEnLigne) return;

    final pending = await _localSource.getVisitesPending();

    for (final visite in pending) {
      try {
        await _remoteSource.enregistrerVisite(visite.toJson());
        await _localSource.marquerCommeSynced(visite.id);
      } catch (_) {
        await _localSource.marquerCommeEchec(visite.id);
      }
    }
  }

  @override
  Future<List<VisiteEntity>> getVisitesParAgent(String agentId) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getVisitesParAgent(agentId);
        return models.map((v) => v.toEntity()).toList();
      } catch (_) {
        final models = await _localSource.getVisitesParAgent(agentId);
        return models.map((v) => v.toEntity()).toList();
      }
    } else {
      final models = await _localSource.getVisitesParAgent(agentId);
      return models.map((v) => v.toEntity()).toList();
    }
  }

  @override
  Future<List<VisiteEntity>> getVisitesParCode(String codeAnonyme) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getVisitesParCode(codeAnonyme);
        return models.map((v) => v.toEntity()).toList();
      } catch (_) {
        return [];
      }
    } else {
      return [];
    }
  }

  VisiteModel _visiteToModelPending(VisiteEntity visite) {
    return VisiteModel(
      id: visite.id,
      codeAnonyme: visite.codeAnonyme,
      cspsId: visite.cspsId,
      agentId: visite.agentId,
      date: visite.date,
      typeVisite: visite.typeVisite.name,
      methodeActuelleId: visite.methodeActuelleId,
      nouvelleMethodeId: visite.nouvelleMethodeId,
      effetsSecondairesSignales: visite.effetsSecondairesSignales,
      notes: visite.notes,
      syncStatus: 'pending',
    );
  }
}
