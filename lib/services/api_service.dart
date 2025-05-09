import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/etudiant.dart';

class ApiService {
  final String baseUrl = "http://192.168.1.15:3000";

  Future<List<Etudiant>> fetchEtudiants({String? classe}) async {
    final uri = Uri.parse(
      classe != null && classe.isNotEmpty
          ? '$baseUrl/inscription?classe=$classe'
          : '$baseUrl/inscription',
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Etudiant.fromJson(e)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des étudiants');
    }
  }
}
