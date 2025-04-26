import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/translations.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('es');
  String _currentLanguage = 'es';

  Locale get locale => _locale;
  String get currentLanguage => _currentLanguage;

  Future<void> init() async {
    await loadLanguagePreference();
  }

  Future<void> loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language_code');
    if (savedLanguage != null) {
      await setLanguage(savedLanguage);
    }
  }

  Future<void> setLanguage(String languageCode) async {
    if (languageCode != _currentLanguage) {
      _currentLanguage = languageCode;
      _locale = Locale(languageCode);
      await _saveLanguagePreference(languageCode);
      notifyListeners();
    }
  }

  Future<void> _saveLanguagePreference(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
  }

  String translate(String key) {
    final translations = Translations.values[_locale.languageCode];
    return translations?[key] ?? key;
  }
}
