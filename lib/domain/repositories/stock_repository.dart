import '../entities/stock_entity.dart';

abstract class StockRepository {
  Future<List<StockEntity>> getStocksParCsps(String cspsId);
  Future<void> decrementerStock(String cspsId, String methodeId, int quantite);
  Future<void> mettreAJourStock(StockEntity stock);
}
