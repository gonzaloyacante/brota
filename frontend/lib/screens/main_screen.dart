import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'home_screen.dart';
import 'catalog_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = const [
    CatalogScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_florist),
            label: languageProvider.translate('catalog'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: languageProvider.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: languageProvider.translate('settings'),
          ),
        ],
      ),
    );
  }
}
