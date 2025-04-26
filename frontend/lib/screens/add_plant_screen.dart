import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../services/api_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class AddPlantScreen extends StatefulWidget {
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();

  void _savePlant() async {
    final plant = Plant(name: _nameController.text, type: _typeController.text);
    try {
      await ApiService.addPlant(plant);
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al agregar planta')));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Planta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: 'Nombre de la planta',
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _typeController,
              hintText: 'Tipo de planta',
            ),
            SizedBox(height: 32),
            CustomButton(text: 'Guardar', onPressed: _savePlant),
          ],
        ),
      ),
    );
  }
}
