import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:weather_wizard/data/models/rest_country_model.dart';
import 'package:weather_wizard/data/services/network_caller.dart';
import 'package:weather_wizard/data/services/network_response.dart';
import 'package:weather_wizard/data/utils/urls.dart';
import 'package:weather_wizard/presentation/ui/pages/slider_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _getNewTasksInProgress = false;


  @override
  void initState() {
    
    getCountry();
    super.initState();
  }

List l = [

];

  Future<void> getCountry() async {

    _getNewTasksInProgress = true;

    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.restCountires);
    _getNewTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      // l = l.fromJson(response.responseJson!);

    } else {
      if (mounted) {
        log('c cannot be loaded');
      }
    }
    
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
                    itemCount: l.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SliderViewPage()));
                          //GoRouter.of(context).go('/slider_view');
                        },
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.amber,
                        ),
                      );
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
