import 'package:brota/providers/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brota/utils/language_provider.dart';
import 'package:flutter/material.dart';

void main() {
  group('ThemeProvider Tests', () {
    late ThemeProvider themeProvider;

    setUp(() {
      themeProvider = ThemeProvider();
    });

    test('tema inicial debe ser sistema', () {
      expect(themeProvider.themeMode, equals(ThemeMode.system));
    });

    test('cambiar tema a oscuro', () {
      themeProvider.setThemeMode(ThemeMode.dark);
      expect(themeProvider.themeMode, equals(ThemeMode.dark));
    });
  });

  group('LanguageProvider Tests', () {
    late LanguageProvider languageProvider;

    setUp(() {
      languageProvider = LanguageProvider();
    });

    test('idioma inicial debe ser español', () {
      expect(languageProvider.locale.languageCode, equals('es'));
    });

    test('cambiar idioma a inglés', () {
      languageProvider.setLanguage('en');
      expect(languageProvider.locale.languageCode, equals('en'));
    });

    test('traducciones en español', () {
      languageProvider.setLanguage('es');
      expect(languageProvider.translate('home'), equals('Inicio'));
      expect(languageProvider.translate('settings'), equals('Configuración'));
    });

    test('traducciones en inglés', () {
      languageProvider.setLanguage('en');
      expect(languageProvider.translate('home'), equals('Home'));
      expect(languageProvider.translate('settings'), equals('Settings'));
    });
  });
}
