import '../../domain/entities/csps_entity.dart';
import '../../domain/repositories/csps_repository.dart';
import '../datasources/remote/csps_remote_source.dart';
import '../datasources/local/csps_local_source.dart';
import '../../core/network/network_checker.dart';

class CspsRepositoryImpl implements CspsRepository {
  final CspsRemoteSource _remoteSource;
  final CspsLocalSource _localSource;
  final NetworkChecker _networkChecker;

  CspsRepositoryImpl({
    required CspsRemoteSource remoteSource,
    required CspsLocalSource localSource,
    required NetworkChecker networkChecker,
  })  : _remoteSource = remoteSource,
        _localSource = localSource,
        _networkChecker = networkChecker;

  @override
  Future<List<CspsEntity>> getCsps() async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getCsps();
        await _localSource.sauvegarderCsps(models);
        return models.map((c) => c.toEntity()).toList();
      } catch (_) {
        final models = await _localSource.getCsps();
        return models.map((c) => c.toEntity()).toList();
      }
    } else {
      final models = await _localSource.getCsps();
      return models.map((c) => c.toEntity()).toList();
    }
  }

  @override
  Future<CspsEntity> getCspsById(String id) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final model = await _remoteSource.getCspsById(id);
        return model.toEntity();
      } catch (_) {
        final model = await _localSource.getCspsById(id);
        return model.toEntity();
      }
    } else {
      final model = await _localSource.getCspsById(id);
      return model.toEntity();
    }
  }

  @override
  Future<List<CspsEntity>> getCspsParDistrict(String districtId) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getCspsParDistrict(districtId);
        return models.map((c) => c.toEntity()).toList();
      } catch (_) {
        final models = await _localSource.getCsps();
        return models
            .where((c) => c.district == districtId)
            .map((c) => c.toEntity())
            .toList();
      }
    } else {
      final models = await _localSource.getCsps();
      return models
          .where((c) => c.district == districtId)
          .map((c) => c.toEntity())
          .toList();
    }
  }

  @override
  Future<List<CspsEntity>> getCspsAvecMethode(String methodeId) async {
    final estEnLigne = await _networkChecker.estConnecte();

    if (estEnLigne) {
      try {
        final models = await _remoteSource.getCspsAvecMethode(methodeId);
        return models.map((c) => c.toEntity()).toList();
      } catch (_) {
        final models = await _localSource.getCsps();
        return models
            .where((c) => c.stocks.any((s) => s.methodeId == methodeId))
            .map((c) => c.toEntity())
            .toList();
      }
    } else {
      final models = await _localSource.getCsps();
      return models
          .where((c) => c.stocks.any((s) => s.methodeId == methodeId))
          .map((c) => c.toEntity())
          .toList();
    }
  }
}
