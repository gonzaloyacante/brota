import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(languageProvider.translate('settings'))),
      body: ListView(
        children: [
          ListTile(
            title: Text(languageProvider.translate('theme')),
            trailing: DropdownButton<ThemeMode>(
              value: themeProvider.themeMode,
              items: [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text(languageProvider.translate('system')),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(languageProvider.translate('light')),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(languageProvider.translate('dark')),
                ),
              ],
              onChanged: (ThemeMode? newThemeMode) {
                if (newThemeMode != null) {
                  themeProvider.setThemeMode(newThemeMode);
                }
              },
            ),
          ),
          ListTile(
            title: Text(languageProvider.translate('language')),
            trailing: DropdownButton<String>(
              value: languageProvider.currentLanguage,
              items: [
                DropdownMenuItem(
                  value: 'en',
                  child: Text(languageProvider.translate('english')),
                ),
                DropdownMenuItem(
                  value: 'es',
                  child: Text(languageProvider.translate('spanish')),
                ),
              ],
              onChanged: (String? newLanguage) {
                if (newLanguage != null) {
                  languageProvider.setLanguage(newLanguage);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
