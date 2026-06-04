class AppConfig {
  AppConfig._();

  static const String appName = 'SIRA';
  static const String appVersion = '1.0.0';
  static const String appTagline =
      'Suivi · Information · Recommandation · Autonomie';

  // Seuils stocks
  static const int seuilStockFaible = 10;
  static const int seuilStockRupture = 0;

  // Cycle menstruel
  static const int dureesCycleMoyenne = 28;
  static const int dureesMenstruationsMoyenne = 5;
  static const double tauxEchecMethodeCalendrier = 0.25;

  // SMS
  static const int maxCaractereSms = 160;

  // Cache
  static const int dureeValiditeCache = 24; // heures

  // Pagination
  static const int taillePage = 20;
}
