import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/plant.dart';
import '../services/api_service.dart';
import '../widgets/plant_card.dart';
import '../providers/language_provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(languageProvider.translate('catalog'))),
      body: const Center(child: Text('Catalog Screen Content')),
    );
  }
}
