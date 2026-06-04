// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SIRA`
  String get appName {
    return Intl.message('SIRA', name: 'appName', desc: '', args: []);
  }

  /// `Suivi · Information · Recommandation · Autonomie`
  String get appTagline {
    return Intl.message(
      'Suivi · Information · Recommandation · Autonomie',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `Continuer`
  String get continuer {
    return Intl.message('Continuer', name: 'continuer', desc: '', args: []);
  }

  /// `Suivant`
  String get suivant {
    return Intl.message('Suivant', name: 'suivant', desc: '', args: []);
  }

  /// `Précédent`
  String get precedent {
    return Intl.message('Précédent', name: 'precedent', desc: '', args: []);
  }

  /// `Commencer`
  String get commencer {
    return Intl.message('Commencer', name: 'commencer', desc: '', args: []);
  }

  /// `Terminer`
  String get terminer {
    return Intl.message('Terminer', name: 'terminer', desc: '', args: []);
  }

  /// `Annuler`
  String get annuler {
    return Intl.message('Annuler', name: 'annuler', desc: '', args: []);
  }

  /// `Confirmer`
  String get confirmer {
    return Intl.message('Confirmer', name: 'confirmer', desc: '', args: []);
  }

  /// `Retour`
  String get retour {
    return Intl.message('Retour', name: 'retour', desc: '', args: []);
  }

  /// `Passer`
  String get passer {
    return Intl.message('Passer', name: 'passer', desc: '', args: []);
  }

  /// `Réessayer`
  String get reessayer {
    return Intl.message('Réessayer', name: 'reessayer', desc: '', args: []);
  }

  /// `Fermer`
  String get fermer {
    return Intl.message('Fermer', name: 'fermer', desc: '', args: []);
  }

  /// `Oui`
  String get oui {
    return Intl.message('Oui', name: 'oui', desc: '', args: []);
  }

  /// `Non`
  String get non {
    return Intl.message('Non', name: 'non', desc: '', args: []);
  }

  /// `Enregistrer`
  String get enregistrer {
    return Intl.message('Enregistrer', name: 'enregistrer', desc: '', args: []);
  }

  /// `Partager`
  String get partager {
    return Intl.message('Partager', name: 'partager', desc: '', args: []);
  }

  /// `Appeler`
  String get appeler {
    return Intl.message('Appeler', name: 'appeler', desc: '', args: []);
  }

  /// `Itinéraire`
  String get itineraire {
    return Intl.message('Itinéraire', name: 'itineraire', desc: '', args: []);
  }

  /// `Votre intimité est protégée`
  String get onboarding1Titre {
    return Intl.message(
      'Votre intimité est protégée',
      name: 'onboarding1Titre',
      desc: '',
      args: [],
    );
  }

  /// `Aucun compte. Aucune inscription.\nVos données restent sur votre téléphone.`
  String get onboarding1Sous {
    return Intl.message(
      'Aucun compte. Aucune inscription.\nVos données restent sur votre téléphone.',
      name: 'onboarding1Sous',
      desc: '',
      args: [],
    );
  }

  /// `Trouvez la méthode qui vous convient`
  String get onboarding2Titre {
    return Intl.message(
      'Trouvez la méthode qui vous convient',
      name: 'onboarding2Titre',
      desc: '',
      args: [],
    );
  }

  /// `Un questionnaire simple,\ndes recommandations personnalisées.`
  String get onboarding2Sous {
    return Intl.message(
      'Un questionnaire simple,\ndes recommandations personnalisées.',
      name: 'onboarding2Sous',
      desc: '',
      args: [],
    );
  }

  /// `Dans votre langue`
  String get onboarding3Titre {
    return Intl.message(
      'Dans votre langue',
      name: 'onboarding3Titre',
      desc: '',
      args: [],
    );
  }

  /// `Français, Mooré ou Dioula.`
  String get onboarding3Sous {
    return Intl.message(
      'Français, Mooré ou Dioula.',
      name: 'onboarding3Sous',
      desc: '',
      args: [],
    );
  }

  /// `Choisissez votre langue`
  String get choisirLangue {
    return Intl.message(
      'Choisissez votre langue',
      name: 'choisirLangue',
      desc: '',
      args: [],
    );
  }

  /// `Choisissez votre espace`
  String get choisirEspace {
    return Intl.message(
      'Choisissez votre espace',
      name: 'choisirEspace',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenue`
  String get bienvenue {
    return Intl.message('Bienvenue', name: 'bienvenue', desc: '', args: []);
  }

  /// `Espace Femme`
  String get espacesFemme {
    return Intl.message(
      'Espace Femme',
      name: 'espacesFemme',
      desc: '',
      args: [],
    );
  }

  /// `Trouvez votre méthode, sans inscription`
  String get espacesFemmeDesc {
    return Intl.message(
      'Trouvez votre méthode, sans inscription',
      name: 'espacesFemmeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Espace Agent de santé`
  String get espacesAgent {
    return Intl.message(
      'Espace Agent de santé',
      name: 'espacesAgent',
      desc: '',
      args: [],
    );
  }

  /// `Aide à la décision et suivi`
  String get espacesAgentDesc {
    return Intl.message(
      'Aide à la décision et suivi',
      name: 'espacesAgentDesc',
      desc: '',
      args: [],
    );
  }

  /// `Espace Gestionnaire`
  String get espacesGestionnaire {
    return Intl.message(
      'Espace Gestionnaire',
      name: 'espacesGestionnaire',
      desc: '',
      args: [],
    );
  }

  /// `Tableau de bord du district`
  String get espacesGestionnaireDesc {
    return Intl.message(
      'Tableau de bord du district',
      name: 'espacesGestionnaireDesc',
      desc: '',
      args: [],
    );
  }

  /// `Connexion requise`
  String get connexionRequise {
    return Intl.message(
      'Connexion requise',
      name: 'connexionRequise',
      desc: '',
      args: [],
    );
  }

  /// `Êtes-vous enceinte en ce moment ?`
  String get questionGrossesse {
    return Intl.message(
      'Êtes-vous enceinte en ce moment ?',
      name: 'questionGrossesse',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous accouché récemment ?`
  String get questionPostPartum {
    return Intl.message(
      'Avez-vous accouché récemment ?',
      name: 'questionPostPartum',
      desc: '',
      args: [],
    );
  }

  /// `Allaitez-vous votre bébé ?`
  String get questionAllaitement {
    return Intl.message(
      'Allaitez-vous votre bébé ?',
      name: 'questionAllaitement',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous de la tension artérielle élevée ?`
  String get questionTension {
    return Intl.message(
      'Avez-vous de la tension artérielle élevée ?',
      name: 'questionTension',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous des migraines avec des signes visuels ?`
  String get questionMigraine {
    return Intl.message(
      'Avez-vous des migraines avec des signes visuels ?',
      name: 'questionMigraine',
      desc: '',
      args: [],
    );
  }

  /// `Lumières, zigzags ou engourdissements avant la migraine`
  String get questionMigraineDesc {
    return Intl.message(
      'Lumières, zigzags ou engourdissements avant la migraine',
      name: 'questionMigraineDesc',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous des antécédents cardiaques ?`
  String get questionCardiovasculaire {
    return Intl.message(
      'Avez-vous des antécédents cardiaques ?',
      name: 'questionCardiovasculaire',
      desc: '',
      args: [],
    );
  }

  /// `Thrombose, maladie du cœur, AVC`
  String get questionCardiovasculaireDesc {
    return Intl.message(
      'Thrombose, maladie du cœur, AVC',
      name: 'questionCardiovasculaireDesc',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous le diabète ?`
  String get questionDiabete {
    return Intl.message(
      'Avez-vous le diabète ?',
      name: 'questionDiabete',
      desc: '',
      args: [],
    );
  }

  /// `Prenez-vous des médicaments en ce moment ?`
  String get questionMedicaments {
    return Intl.message(
      'Prenez-vous des médicaments en ce moment ?',
      name: 'questionMedicaments',
      desc: '',
      args: [],
    );
  }

  /// `Avez-vous eu un cancer du sein ?`
  String get questionCancer {
    return Intl.message(
      'Avez-vous eu un cancer du sein ?',
      name: 'questionCancer',
      desc: '',
      args: [],
    );
  }

  /// `Fumez-vous et quel est votre âge ?`
  String get questionTabac {
    return Intl.message(
      'Fumez-vous et quel est votre âge ?',
      name: 'questionTabac',
      desc: '',
      args: [],
    );
  }

  /// `Souhaitez-vous une méthode discrète ?`
  String get questionDiscretion {
    return Intl.message(
      'Souhaitez-vous une méthode discrète ?',
      name: 'questionDiscretion',
      desc: '',
      args: [],
    );
  }

  /// `Combien de fois pouvez-vous venir au CSPS ?`
  String get questionVisite {
    return Intl.message(
      'Combien de fois pouvez-vous venir au CSPS ?',
      name: 'questionVisite',
      desc: '',
      args: [],
    );
  }

  /// `Non, je ne suis pas enceinte`
  String get reponsePasEnceinte {
    return Intl.message(
      'Non, je ne suis pas enceinte',
      name: 'reponsePasEnceinte',
      desc: '',
      args: [],
    );
  }

  /// `Oui, je suis enceinte`
  String get reponseEnceinte {
    return Intl.message(
      'Oui, je suis enceinte',
      name: 'reponseEnceinte',
      desc: '',
      args: [],
    );
  }

  /// `Je ne sais pas`
  String get reponseNeSaisPas {
    return Intl.message(
      'Je ne sais pas',
      name: 'reponseNeSaisPas',
      desc: '',
      args: [],
    );
  }

  /// `Normale`
  String get tensionNormale {
    return Intl.message('Normale', name: 'tensionNormale', desc: '', args: []);
  }

  /// `Élevée, mais contrôlée par médicament`
  String get tensionEleveeControlee {
    return Intl.message(
      'Élevée, mais contrôlée par médicament',
      name: 'tensionEleveeControlee',
      desc: '',
      args: [],
    );
  }

  /// `Élevée, non contrôlée`
  String get tensionEleveeNonControlee {
    return Intl.message(
      'Élevée, non contrôlée',
      name: 'tensionEleveeNonControlee',
      desc: '',
      args: [],
    );
  }

  /// `Très élevée (plus de 160/100)`
  String get tensionTresElevee {
    return Intl.message(
      'Très élevée (plus de 160/100)',
      name: 'tensionTresElevee',
      desc: '',
      args: [],
    );
  }

  /// `Non`
  String get diabeteAucun {
    return Intl.message('Non', name: 'diabeteAucun', desc: '', args: []);
  }

  /// `Oui, sans complications`
  String get diabeteSansComplication {
    return Intl.message(
      'Oui, sans complications',
      name: 'diabeteSansComplication',
      desc: '',
      args: [],
    );
  }

  /// `Oui, avec complications vasculaires`
  String get diabeteAvecComplication {
    return Intl.message(
      'Oui, avec complications vasculaires',
      name: 'diabeteAvecComplication',
      desc: '',
      args: [],
    );
  }

  /// `Rifampicine (tuberculose)`
  String get medicamentRifampicine {
    return Intl.message(
      'Rifampicine (tuberculose)',
      name: 'medicamentRifampicine',
      desc: '',
      args: [],
    );
  }

  /// `Anticonvulsivants (épilepsie)`
  String get medicamentAnticonvulsivants {
    return Intl.message(
      'Anticonvulsivants (épilepsie)',
      name: 'medicamentAnticonvulsivants',
      desc: '',
      args: [],
    );
  }

  /// `Antirétroviraux (VIH)`
  String get medicamentARV {
    return Intl.message(
      'Antirétroviraux (VIH)',
      name: 'medicamentARV',
      desc: '',
      args: [],
    );
  }

  /// `Autre médicament`
  String get medicamentAutre {
    return Intl.message(
      'Autre médicament',
      name: 'medicamentAutre',
      desc: '',
      args: [],
    );
  }

  /// `Aucun médicament`
  String get medicamentAucun {
    return Intl.message(
      'Aucun médicament',
      name: 'medicamentAucun',
      desc: '',
      args: [],
    );
  }

  /// `Oui, il y a moins de 6 semaines`
  String get postPartumMoinsDe42j {
    return Intl.message(
      'Oui, il y a moins de 6 semaines',
      name: 'postPartumMoinsDe42j',
      desc: '',
      args: [],
    );
  }

  /// `Oui, il y a 6 semaines à 6 mois`
  String get postPartum42jA6m {
    return Intl.message(
      'Oui, il y a 6 semaines à 6 mois',
      name: 'postPartum42jA6m',
      desc: '',
      args: [],
    );
  }

  /// `Oui, il y a plus de 6 mois`
  String get postPartumPlusDe6m {
    return Intl.message(
      'Oui, il y a plus de 6 mois',
      name: 'postPartumPlusDe6m',
      desc: '',
      args: [],
    );
  }

  /// `Non`
  String get postPartumNon {
    return Intl.message('Non', name: 'postPartumNon', desc: '', args: []);
  }

  /// `Oui, allaitement exclusif`
  String get allaitementExclusif {
    return Intl.message(
      'Oui, allaitement exclusif',
      name: 'allaitementExclusif',
      desc: '',
      args: [],
    );
  }

  /// `Oui, allaitement partiel`
  String get allaitementPartiel {
    return Intl.message(
      'Oui, allaitement partiel',
      name: 'allaitementPartiel',
      desc: '',
      args: [],
    );
  }

  /// `Non, je n'allaite pas`
  String get allaitementNon {
    return Intl.message(
      'Non, je n\'allaite pas',
      name: 'allaitementNon',
      desc: '',
      args: [],
    );
  }

  /// `Vos recommandations`
  String get resultatsTitre {
    return Intl.message(
      'Vos recommandations',
      name: 'resultatsTitre',
      desc: '',
      args: [],
    );
  }

  /// `Recommandé pour vous`
  String get resultatsPremierChoix {
    return Intl.message(
      'Recommandé pour vous',
      name: 'resultatsPremierChoix',
      desc: '',
      args: [],
    );
  }

  /// `Autres options possibles`
  String get resultatsAutresOptions {
    return Intl.message(
      'Autres options possibles',
      name: 'resultatsAutresOptions',
      desc: '',
      args: [],
    );
  }

  /// `Déconseillé dans votre situation`
  String get resultatsDeconseille {
    return Intl.message(
      'Déconseillé dans votre situation',
      name: 'resultatsDeconseille',
      desc: '',
      args: [],
    );
  }

  /// `Comparer ces méthodes`
  String get comparerMethodes {
    return Intl.message(
      'Comparer ces méthodes',
      name: 'comparerMethodes',
      desc: '',
      args: [],
    );
  }

  /// `Trouver un CSPS`
  String get trouverCSPS {
    return Intl.message(
      'Trouver un CSPS',
      name: 'trouverCSPS',
      desc: '',
      args: [],
    );
  }

  /// `Centres de santé proches`
  String get carteTitre {
    return Intl.message(
      'Centres de santé proches',
      name: 'carteTitre',
      desc: '',
      args: [],
    );
  }

  /// `Rechercher un CSPS...`
  String get carteRecherche {
    return Intl.message(
      'Rechercher un CSPS...',
      name: 'carteRecherche',
      desc: '',
      args: [],
    );
  }

  /// `En stock`
  String get carteEnStock {
    return Intl.message('En stock', name: 'carteEnStock', desc: '', args: []);
  }

  /// `Stock faible`
  String get carteFaible {
    return Intl.message(
      'Stock faible',
      name: 'carteFaible',
      desc: '',
      args: [],
    );
  }

  /// `Rupture`
  String get carteRupture {
    return Intl.message('Rupture', name: 'carteRupture', desc: '', args: []);
  }

  /// `Ouvert`
  String get carteOuvert {
    return Intl.message('Ouvert', name: 'carteOuvert', desc: '', args: []);
  }

  /// `Fermé`
  String get carteFerme {
    return Intl.message('Fermé', name: 'carteFerme', desc: '', args: []);
  }

  /// `Apprendre`
  String get educatifTitre {
    return Intl.message('Apprendre', name: 'educatifTitre', desc: '', args: []);
  }

  /// `Les méthodes contraceptives`
  String get educatifMethodes {
    return Intl.message(
      'Les méthodes contraceptives',
      name: 'educatifMethodes',
      desc: '',
      args: [],
    );
  }

  /// `Assistant SIRA`
  String get chatbotTitre {
    return Intl.message(
      'Assistant SIRA',
      name: 'chatbotTitre',
      desc: '',
      args: [],
    );
  }

  /// `En ligne`
  String get chatbotEnLigne {
    return Intl.message('En ligne', name: 'chatbotEnLigne', desc: '', args: []);
  }

  /// `Posez votre question...`
  String get chatbotPlaceholder {
    return Intl.message(
      'Posez votre question...',
      name: 'chatbotPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Identifiant`
  String get loginIdentifiant {
    return Intl.message(
      'Identifiant',
      name: 'loginIdentifiant',
      desc: '',
      args: [],
    );
  }

  /// `Code PIN`
  String get loginPin {
    return Intl.message('Code PIN', name: 'loginPin', desc: '', args: []);
  }

  /// `Se connecter`
  String get loginBouton {
    return Intl.message(
      'Se connecter',
      name: 'loginBouton',
      desc: '',
      args: [],
    );
  }

  /// `Code PIN oublié ?`
  String get loginOublie {
    return Intl.message(
      'Code PIN oublié ?',
      name: 'loginOublie',
      desc: '',
      args: [],
    );
  }

  /// `Contactez votre superviseur`
  String get loginOublieDesc {
    return Intl.message(
      'Contactez votre superviseur',
      name: 'loginOublieDesc',
      desc: '',
      args: [],
    );
  }

  /// `Identifiant ou code PIN incorrect`
  String get loginErreur {
    return Intl.message(
      'Identifiant ou code PIN incorrect',
      name: 'loginErreur',
      desc: '',
      args: [],
    );
  }

  /// `Bonjour,`
  String get agentBonjour {
    return Intl.message('Bonjour,', name: 'agentBonjour', desc: '', args: []);
  }

  /// `Aujourd'hui`
  String get agentAujourdhui {
    return Intl.message(
      'Aujourd\'hui',
      name: 'agentAujourdhui',
      desc: '',
      args: [],
    );
  }

  /// `Visites`
  String get agentVisites {
    return Intl.message('Visites', name: 'agentVisites', desc: '', args: []);
  }

  /// `Stocks`
  String get agentStocks {
    return Intl.message('Stocks', name: 'agentStocks', desc: '', args: []);
  }

  /// `Alertes`
  String get agentAlertes {
    return Intl.message('Alertes', name: 'agentAlertes', desc: '', args: []);
  }

  /// `Accueil`
  String get agentAccueil {
    return Intl.message('Accueil', name: 'agentAccueil', desc: '', args: []);
  }

  /// `Disponible`
  String get stockOk {
    return Intl.message('Disponible', name: 'stockOk', desc: '', args: []);
  }

  /// `Stock faible`
  String get stockFaible {
    return Intl.message(
      'Stock faible',
      name: 'stockFaible',
      desc: '',
      args: [],
    );
  }

  /// `Rupture de stock`
  String get stockRupture {
    return Intl.message(
      'Rupture de stock',
      name: 'stockRupture',
      desc: '',
      args: [],
    );
  }

  /// `Pas de connexion. Vérifiez votre réseau.`
  String get erreurReseau {
    return Intl.message(
      'Pas de connexion. Vérifiez votre réseau.',
      name: 'erreurReseau',
      desc: '',
      args: [],
    );
  }

  /// `Erreur serveur. Réessayez plus tard.`
  String get erreurServeur {
    return Intl.message(
      'Erreur serveur. Réessayez plus tard.',
      name: 'erreurServeur',
      desc: '',
      args: [],
    );
  }

  /// `Une erreur est survenue.`
  String get erreurInconnu {
    return Intl.message(
      'Une erreur est survenue.',
      name: 'erreurInconnu',
      desc: '',
      args: [],
    );
  }

  /// `Chargement...`
  String get chargement {
    return Intl.message(
      'Chargement...',
      name: 'chargement',
      desc: '',
      args: [],
    );
  }

  /// `Aucun résultat`
  String get aucunResultat {
    return Intl.message(
      'Aucun résultat',
      name: 'aucunResultat',
      desc: '',
      args: [],
    );
  }

  /// `Attention : la méthode du calendrier a un taux d'échec de 25%. Elle ne remplace pas une contraception médicale.`
  String get avertissementCalendrier {
    return Intl.message(
      'Attention : la méthode du calendrier a un taux d\'échec de 25%. Elle ne remplace pas une contraception médicale.',
      name: 'avertissementCalendrier',
      desc: '',
      args: [],
    );
  }

  /// `Votre avis nous aide`
  String get retourExperienceTitre {
    return Intl.message(
      'Votre avis nous aide',
      name: 'retourExperienceTitre',
      desc: '',
      args: [],
    );
  }

  /// `Comment évaluez-vous votre méthode ?`
  String get retourExperienceNote {
    return Intl.message(
      'Comment évaluez-vous votre méthode ?',
      name: 'retourExperienceNote',
      desc: '',
      args: [],
    );
  }

  /// `Avant de continuer`
  String get consentementTitre {
    return Intl.message(
      'Avant de continuer',
      name: 'consentementTitre',
      desc: '',
      args: [],
    );
  }

  /// `Ces recommandations sont basées sur les critères médicaux de l'OMS. Elles ne remplacent pas l'avis d'un professionnel de santé. Consultez votre agent de santé avant de choisir une méthode.`
  String get consentementTexte {
    return Intl.message(
      'Ces recommandations sont basées sur les critères médicaux de l\'OMS. Elles ne remplacent pas l\'avis d\'un professionnel de santé. Consultez votre agent de santé avant de choisir une méthode.',
      name: 'consentementTexte',
      desc: '',
      args: [],
    );
  }

  /// `Je comprends et je continue`
  String get consentementAccepter {
    return Intl.message(
      'Je comprends et je continue',
      name: 'consentementAccepter',
      desc: '',
      args: [],
    );
  }

  /// `Synchronisation en attente`
  String get syncEnAttente {
    return Intl.message(
      'Synchronisation en attente',
      name: 'syncEnAttente',
      desc: '',
      args: [],
    );
  }

  /// `Données synchronisées`
  String get syncReussie {
    return Intl.message(
      'Données synchronisées',
      name: 'syncReussie',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'dioula'),
      Locale.fromSubtags(languageCode: 'moore'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
