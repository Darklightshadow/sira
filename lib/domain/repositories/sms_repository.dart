abstract class SmsRepository {
  Future<void> envoyerRappel(String telephone, String message);
  Future<void> envoyerRecapVisite(
      String telephone, String codeAnonyme, String methodeNom);
}
