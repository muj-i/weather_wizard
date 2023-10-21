import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryCapitalsList extends StatelessWidget {
  const CountryCapitalsList({
    super.key, required this.capitalName,
   
  });
  final String? capitalName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
        elevation: .5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 22,
                color: Color(0xFF5884D7),
              ),
              const SizedBox(width: 10),
              Text(
                'USA',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF5884D7),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://ssl.gstatic.com/onebox/weather/64/sunny.png',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    capitalName?? 'fdefdjsfv',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF555555),
                    ),
                  ),
                  Text(
                    '24 Degrees',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
