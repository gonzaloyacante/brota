import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/plant.dart';

class ApiService {
  static const String baseUrl =
      'http://10.0.2.2:3000/api'; // Para emulador Android

  static Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['plants'] ?? [];
      return data.map((plant) => Plant.fromJson(plant)).toList();
    } else {
      throw Exception('Error al cargar plantas');
    }
  }

  static Future<void> addPlant(Plant plant) async {
    final response = await http.post(
      Uri.parse('$baseUrl/plants'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(plant.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al agregar planta');
    }
  }
}
