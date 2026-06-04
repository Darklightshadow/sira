import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/remote/stock_remote_source.dart';
import '../../core/network/network_checker.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteSource _remoteSource;
  final NetworkChecker _networkChecker;

  StockRepositoryImpl({
    required StockRemoteSource remoteSource,
    required NetworkChecker networkChecker,
  })  : _remoteSource = remoteSource,
        _networkChecker = networkChecker;

  @override
  Future<List<StockEntity>> getStocksParCsps(String cspsId) async {
    final estEnLigne = await _networkChecker.estConnecte();
    if (!estEnLigne) return [];

    final models = await _remoteSource.getStocksParCsps(cspsId);
    return models.map((s) => s.toEntity()).toList();
  }

  @override
  Future<void> decrementerStock(
    String cspsId,
    String methodeId,
    int quantite,
  ) async {
    await _remoteSource.decrementerStock(cspsId, methodeId, quantite);
  }

  @override
  Future<void> mettreAJourStock(StockEntity stock) async {
    await _remoteSource.mettreAJourStock({
      'csps_id': stock.cspsId,
      'methode_id': stock.methodeId,
      'quantite_disponible': stock.quantiteDisponible,
      'seuil_alerte': stock.seuilAlerte,
    });
  }
}
