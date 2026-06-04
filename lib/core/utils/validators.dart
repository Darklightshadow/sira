class Validators {
  Validators._();

  static String? identifiant(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Identifiant requis';
    }
    if (value.trim().length < 3) {
      return 'Identifiant trop court';
    }
    return null;
  }

  static String? pin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Code PIN requis';
    }
    if (!RegExp(r'^\d{4}$').hasMatch(value.trim())) {
      return 'Le code PIN doit contenir 4 chiffres';
    }
    return null;
  }

  static String? telephone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Numéro requis';
    }
    if (!RegExp(r'^\+?[0-9]{8,15}$').hasMatch(value.trim())) {
      return 'Numéro invalide';
    }
    return null;
  }

  static String? codeAnonyme(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Code anonyme requis';
    }
    if (!RegExp(r'^P-\d{4}$').hasMatch(value.trim().toUpperCase())) {
      return 'Format attendu : P-0000';
    }
    return null;
  }

  static String? required(String? value, {String message = 'Champ requis'}) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }
}
