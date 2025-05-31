import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training_dz/models/country.model.dart';
import 'package:training_dz/models/country.model.extension.dart';

class ApiFetchScreen extends StatefulWidget {
  const ApiFetchScreen({super.key});

  @override
  State<ApiFetchScreen> createState() => _ApiFetchScreen();
}

class _ApiFetchScreen extends State<ApiFetchScreen> {
  List<CountryModel> countries = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    isloading = true;
    final url = Uri.parse('https://restcountries.com/v3.1/all');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        countries = data.map((item) => CountryModel.fromMap(item)).toList();

        isloading = false;
      });
    } else {
      throw Exception('erreur de chargement');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les pays du monde')),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Fetch Data"),
        onPressed: () {
          fetchCountries();
        },
      ),
      body:
          isloading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text("Population: \n${country.population}"),
                          title: Text(country.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Languages: ${country.formattedLangs}"),
                              Text("Continents: ${country.formattedContin}"),
                            ],
                          ),
                          leading: Image.network(country.imageUrl, width: 60, height: 40),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
