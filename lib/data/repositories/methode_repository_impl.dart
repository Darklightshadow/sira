import '../../domain/entities/methode_entity.dart';
import '../../domain/repositories/methode_repository.dart';
import '../datasources/remote/methode_remote_source.dart';
import '../datasources/local/methode_local_source.dart';
import '../../core/network/network_checker.dart';

class MethodeRepositoryImpl implements MethodeRepository {
  final MethodeRemoteSource _remoteSource;
  final MethodeLocalSource _localSource;
  final NetworkChecker _networkChecker;

  MethodeRepositoryImpl({
    required MethodeRemoteSource remoteSource,
    required MethodeLocalSource localSource,
    required NetworkChecker networkChecker,
  })  : _remoteSource = remoteSource,
        _localSource = localSource,
        _networkChecker = networkChecker;

  @override
  Future<List<MethodeEntity>> getMethodes() async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getMethodes();
        await _localSource.sauvegarderMethodes(models);
        return models.map((m) => m.toEntity()).toList();
      } catch (_) {
        final models = await _localSource.getMethodes();
        return models.map((m) => m.toEntity()).toList();
      }
    } else {
      final models = await _localSource.getMethodes();
      return models.map((m) => m.toEntity()).toList();
    }
  }

  @override
  Future<MethodeEntity> getMethodeById(String id) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final model = await _remoteSource.getMethodeById(id);
        return model.toEntity();
      } catch (_) {
        final model = await _localSource.getMethodeById(id);
        return model.toEntity();
      }
    } else {
      final model = await _localSource.getMethodeById(id);
      return model.toEntity();
    }
  }
}
