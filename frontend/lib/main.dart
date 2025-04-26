import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'screens/main_screen.dart';
import 'constants/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  await _setDeviceOrientation();

  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    dotenv.env['API_URL'] = 'http://localhost:3000';
    dotenv.env['ENV'] = 'development';
  }
}

Future<void> _setDeviceOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()..init()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()..init()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final languageProvider = Provider.of<LanguageProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Brota 🌱',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            locale: languageProvider.locale,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
