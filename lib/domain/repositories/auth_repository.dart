import '../entities/agent_entity.dart';

abstract class AuthRepository {
  Future<AgentEntity> login(String identifiant, String pin);
  Future<void> logout();
  Future<AgentEntity?> getAgentConnecte();
  Future<bool> estConnecte();
}
