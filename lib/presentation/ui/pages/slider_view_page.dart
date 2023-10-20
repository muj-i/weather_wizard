import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_wizard/presentation/ui/widgets/constraints.dart';

class SliderViewPage extends StatefulWidget {
  const SliderViewPage({super.key});

  @override
  State<SliderViewPage> createState() => _SliderViewPageState();
}

class _SliderViewPageState extends State<SliderViewPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        GoRouter.of(context).go('/');
        return false;
      },
      child: Scaffold(
        backgroundColor: AllOverColors.sliderViewPageBackgroundColor,
        appBar: AppBar(
          title: const Text('Slider view'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
              //color: Colors.black,
              ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.locationDot,
                    size: 22,
                    color: AllOverColors.sliderViewPageItemsBackgroundColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'USA',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AllOverColors.sliderViewPageItemsBackgroundColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 100,
                child: Image.network(
                  'https://ssl.gstatic.com/onebox/weather/64/sunny.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Chance of rain 60%',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  // fontWeight: FontWeight.w500,
                  color: AllOverColors.sliderViewPageItemsBackgroundColor,
                ),
              ),
              Text(
                'Partly Cloudy',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AllOverColors.sliderViewPageItemsBackgroundColor,
                ),
              ),
              const SizedBox(height: 55),
              const FahrenheitWidget(),
              const SizedBox(height: 20),
              const NewWidget1()
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget1 extends StatelessWidget {
  const NewWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(Icons.cloud,
                  color: AllOverColors.sliderViewPageItemsBackgroundColor),
              Text(
                ' 10%',
                style: TextStyle(
                    color: AllOverColors.sliderViewPageItemsBackgroundColor),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.cloud,
                  color: AllOverColors.sliderViewPageItemsBackgroundColor),
              Text(
                ' 10%',
                style: TextStyle(
                    color: AllOverColors.sliderViewPageItemsBackgroundColor),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.cloud,
                  color: AllOverColors.sliderViewPageItemsBackgroundColor),
              Text(
                ' 10%',
                style: TextStyle(
                    color: AllOverColors.sliderViewPageItemsBackgroundColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FahrenheitWidget extends StatelessWidget {
  const FahrenheitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '5',
          style: GoogleFonts.poppins(
            color: AllOverColors.sliderViewPageItemsBackgroundColor,
            fontSize: 45,
            fontWeight: FontWeight.w600,
          ),
        ),
        Column(
          children: [
            Text(
              'o F',
              style: GoogleFonts.poppins(
                color: AllOverColors.sliderViewPageItemsBackgroundColor,
                fontSize: 22,
              ),
            ),
            const Text(
              '',
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ],
    );
  }
}
