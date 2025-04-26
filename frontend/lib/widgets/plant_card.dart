import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.local_florist, color: Colors.green),
        title: Text(plant.name),
        subtitle: Text('Tipo: ${plant.type}'),
      ),
    );
  }
}
