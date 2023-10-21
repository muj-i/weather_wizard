import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_wizard/presentation/ui/pages/slider_view_page.dart';
import 'package:weather_wizard/presentation/ui/widgets/country_capital_listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _locationController = TextEditingController();
  final List<Map<String, String>> _countryList = [];

  void fetchCountryData(String capital) async {
    try {
      final apiUrl = 'https://restcountries.com/v3.1/capital/$capital';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final countryName = data['name']['common'];
        final countryCapital = data['capital'][0];

        setState(() {
          _countryList.add({
            'countryName': countryName,
            'countryCapital': countryCapital,
          });
        });
      } else {
        throw Exception('Failed to fetch country data');
      }
    } catch (error) {
      // Handle errors
    }
  }

  void saveRecentSearches(List<dynamic> countryList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedSearches =
        countryList.map((search) => json.encode(search)).toList();
    await prefs.setStringList('recentSearches', encodedSearches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _locationController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search country capitals by region',
                  suffixIcon: Icon(
                    IconlyLight.search,
                    color: Colors.orange.shade800,
                  ),
                ),
                onSubmitted: (value) {
                  fetchCountryData(_locationController.text);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: _countryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SliderViewPage(),
                            ),
                          );
                        },
                        child: CountryCapitalsList(
                          capitalName: _countryList[index]['countryCapital'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
