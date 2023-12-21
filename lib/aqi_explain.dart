import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AQIExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(        
            children: [
              const SizedBox(height: 30),
                Center(child: Image.asset('lib/images/aqi.png')),
              const SizedBox(height: 45),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'What Is AQI?',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Container(
                color: Colors.indigo,
                height: 2,
                width: 250,
              ),
              const SizedBox(height:10),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '      Air Quality Index (AQI) is a numerical scale used to communicate how polluted the air currently is in a specific location. It provides a simple way for the general public to understand the quality of the air. AQI is used by environmental agencies and health organizations to convey information about potential health risks associated with air pollution.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'AQI Categories',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Container(
                color: Colors.indigo,
                height: 2,
                width: 250,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '* 0-50 (Good): Air quality is considered satisfactory, and air pollution poses little or no risk.\n\n* 51-100 (Moderate): Air quality is acceptable; however, some pollutants may be a concern for a few individuals who are unusually sensitive to pollution.\n\n* 101-150 (Unhealthy for Sensitive Groups): Members of sensitive groups, such as individuals with respiratory conditions, may experience health effects, but the general public is mostly fine.\n\n* 151-200 (Unhealthy): Everyone may begin to experience adverse health effects, and members of sensitive groups may experience more serious effects.\n\n* 201-300 (Very Unhealthy): This would trigger a health alert signifying that everyone may experience more serious health effects.\n\n* 300+ (Hazardous): This would trigger health warnings of emergency conditions. The entire population is more likely to be affected.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      )
    );
  }
}
