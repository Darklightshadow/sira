class SiraDateUtils {
  SiraDateUtils._();

  static String formaterDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  static String formaterHeure(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}h'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  static String formaterDateHeure(DateTime date) {
    return '${formaterDate(date)} à ${formaterHeure(date)}';
  }

  static String formaterDateCourte(DateTime date) {
    final mois = [
      '',
      'jan',
      'fév',
      'mar',
      'avr',
      'mai',
      'jun',
      'jul',
      'aoû',
      'sep',
      'oct',
      'nov',
      'déc',
    ];
    return '${date.day} ${mois[date.month]} ${date.year}';
  }

  static String tempsEcoule(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'À l\'instant';
    if (diff.inMinutes < 60) return 'Il y a ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'Il y a ${diff.inHours}h';
    if (diff.inDays < 7) return 'Il y a ${diff.inDays} j';
    return formaterDate(date);
  }

  static bool memeJour(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static DateTime debutSemaine(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  static List<DateTime> joursduMois(int annee, int mois) {
    final premier = DateTime(annee, mois, 1);
    final dernier = DateTime(annee, mois + 1, 0);
    return List.generate(
      dernier.day,
      (i) => DateTime(annee, mois, i + 1),
    );
  }
}
