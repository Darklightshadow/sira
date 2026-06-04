import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _tokenKey = 'auth_token';
  static const String _langueKey = 'langue_selectionnee';
  static const String _onboardingKey = 'onboarding_complete';

  Future<void> sauvegarderToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> supprimerToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> sauvegarderLangue(String langue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langueKey, langue);
  }

  Future<String> getLangue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_langueKey) ?? 'fr';
  }

  Future<void> marquerOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  Future<bool> estOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }
}
