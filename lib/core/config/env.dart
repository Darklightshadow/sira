class Env {
  Env._();

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:5000/api',
  );

  static const String africasTalkingKey = String.fromEnvironment(
    'AT_API_KEY',
    defaultValue: '',
  );

  static const String africasTalkingUsername = String.fromEnvironment(
    'AT_USERNAME',
    defaultValue: 'sandbox',
  );

  static bool get estDebug {
    bool debug = false;
    assert(() {
      debug = true;
      return true;
    }());
    return debug;
  }
}
