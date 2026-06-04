class ApiEndpoints {
  ApiEndpoints._();

  // Base
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:5000/api',
  );

  // Public — espace femme (sans auth)
  static const String methodes = '/public/methodes';
  static String methodeById(String id) => '/public/methodes/$id';
  static const String csps = '/public/csps';
  static String cspsById(String id) => '/public/csps/$id';
  static String cspsParDistrict(String id) => '/public/csps/district/$id';
  static String cspsAvecMethode(String id) => '/public/csps/methode/$id';
  static const String recommandation = '/public/recommandation';

  // Agent — authentification
  static const String login = '/agent/auth/login';
  static const String agentMe = '/agent/auth/me';

  // Agent — visites
  static const String visites = '/agent/visites';
  static String visitesParAgent(String id) => '/agent/visites/agent/$id';
  static String visitesParCode(String code) => '/agent/visites/code/$code';

  // Agent — stocks
  static String stocksParCsps(String id) => '/agent/stocks/$id';
  static String decrementerStock(String cspsId, String methodeId) =>
      '/agent/stocks/$cspsId/$methodeId/decrement';
  static String mettreAJourStock(String cspsId) => '/agent/stocks/$cspsId';

  // Agent — alertes
  static String alertesParCsps(String id) => '/agent/alertes/csps/$id';
  static String marquerAlerteLue(String id) => '/agent/alertes/$id/lue';

  // Agent — SMS
  static const String sms = '/agent/sms/envoyer';

  // Gestionnaire
  static String statsDistrict(String id) => '/gestionnaire/district/$id/stats';
  static String alertesParDistrict(String id) =>
      '/gestionnaire/district/$id/alertes';
}
