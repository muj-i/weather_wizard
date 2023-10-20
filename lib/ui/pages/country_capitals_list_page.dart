import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:weather_wizard/ui/widgets/country_capital_listtile.dart';

class CountryCapitalsListPage extends StatefulWidget {
  const CountryCapitalsListPage({super.key});

  @override
  State<CountryCapitalsListPage> createState() =>
      _CountryCapitalsListPageState();
}

class _CountryCapitalsListPageState extends State<CountryCapitalsListPage> {
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
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: 'Search country capitals by region',
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: Colors.orange.shade800,
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {

                        } ,
                        child: const CountryCapitalsListTile());
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 12,
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
