import '../entities/methode_entity.dart';

abstract class MethodeRepository {
  Future<List<MethodeEntity>> getMethodes();
  Future<MethodeEntity> getMethodeById(String id);
}
