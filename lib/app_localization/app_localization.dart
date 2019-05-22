import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_player/l10n/messages_all.dart';

class AppLocalizations {

  // constructor to hold the final Local variable
  AppLocalizations(this.locale);

  final Locale locale;

  // here to load the user Local
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    /// here we call the message_all.dart file to identify the user first local and this callback called before the localName called
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations(locale);
    });
  }
  // create an easily way to refer to AppLocalizations class
  /// it is like the singleton pattern
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    // Define all strings Here in form of Map for all supported languages
    'en': {
      'title': 'Media player',
      'photo':'photo',
      'downloads':'Downloads',
      'about_artist':'Artist',
      'about_company':'About us',
      'logout':'Log Out',
      'login':'Log In',
      'search':'Search...',


      'label':'appLabel',
      'debug':'\n\nApplicationDebuging : '
    },
    'ar': {
      'title': 'مشغل الوسائط',
      'photo':'الصور',
      'downloads':'التحميلات',
      'about_artist':'عن الفنان',
      'about_company':'عنَا',
      'logout':'خروج',
      'login':'تسجيل',
      'search':'بحث...',


      'label':'appLabel',
      'debug':'\n\nApplicationDebuging : '
    },
  };

  // here set up getters to get values in the user local language
  // _localizedValues[locale.languageCode]['title'];
  String get title => Intl.message(_localizedValues[locale.languageCode]['title'], name: 'title', desc: 'The application title');
  String get photo => Intl.message(_localizedValues[locale.languageCode]['photo'], name: 'photo');
  String get downloads => Intl.message(_localizedValues[locale.languageCode]['downloads'], name: 'downloads');
  String get aboutArtist => Intl.message(_localizedValues[locale.languageCode]['about_artist'], name: 'about_artist');
  String get aboutCompany => Intl.message(_localizedValues[locale.languageCode]['about_company'], name: 'about_company');
  String get logout => Intl.message(_localizedValues[locale.languageCode]['logout'], name: 'logout');
  String get login => Intl.message(_localizedValues[locale.languageCode]['login'], name: 'login');
  String get search => Intl.message(_localizedValues[locale.languageCode]['search'], name: 'search');
  String get label => Intl.message(_localizedValues[locale.languageCode]['label'], name: 'label');
  String get debug => Intl.message(_localizedValues[locale.languageCode]['debug'], name: 'debug');

}

// here to check if the local language is supported or not
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // here create a constructor to instantiate this class inside the app root class (main.dart)
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // supports only arabic and English
    return ['en', 'ar'].contains(locale.languageCode);
  }

  //now time to load the user local
  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  // it's obvious that re-load the widget
  // todo but its false and when lang change the text re-loaded!!
  // todo Understand !
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
