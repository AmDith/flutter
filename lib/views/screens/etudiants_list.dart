import 'package:flutter/material.dart';
import '../../../models/etudiant.dart';
import '../../../services/api_service.dart';

class EtudiantsListScreen extends StatefulWidget {
  @override
  _EtudiantsListScreenState createState() => _EtudiantsListScreenState();
}

class _EtudiantsListScreenState extends State<EtudiantsListScreen> {
  final ApiService _apiService = ApiService();
  List<Etudiant> _etudiants = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEtudiants();
  }

  void _loadEtudiants({String? classe}) async {
    final data = await _apiService.fetchEtudiants(classe: classe);
    setState(() {
      _etudiants = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Étudiants inscrits')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Classe (ex: L1 MAE)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _loadEtudiants(classe: _searchController.text.trim());
                  },
                  child: Text('Rechercher'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _etudiants.length,
              itemBuilder: (context, index) {
                final etu = _etudiants[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text('${etu.nom} ${etu.prenom}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Classe : ${etu.classe}'),
                        Text('Matricule : ${etu.matricule}'),
                        Text('Email : ${etu.email}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
