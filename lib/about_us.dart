// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Column(
        children: [
          // const SizedBox(height: 10),
          Container(
            color: Colors.indigo.shade50,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'The Creators',
                        style: GoogleFonts.plusJakartaSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        ),
                      ),                    
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.black,
                      height: 2,
                      width: double.infinity,        
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'AirBox was a University project for 3 Binus University student\'s, namely Patrick Arthur Sahalaraja, Roger Gibson, and Steven Mulya Tjendratma, Patrick worked on the mobile app, while Roger worked on the hardware and circuitry, and Steven worked on the 3D design of the casing for the device.',
                        style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,                        
                        color: Colors.black,
                        ),
                      ),                    
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                color: Colors.indigo,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(                
                  children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'AirBox',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.white,
                      height: 2,
                      width: double.infinity,        
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'The AirBox is an air purifier that that is designed to improve the air quality of the area it is located in, the AirBox is equipped with a 12V blower fan to suck in the air, and a HEPA filter to filter out the dust and other particles in the air. The AirBox is also equiped with a SDS011 Nova PM Sensor that detect\'s the amount of PM 10 and PM 2.5 within the vicinity, and it also has a 128x64 OLED screen that displays information about the PM within the area the AirBox is in. And as you know we also have an App to go along with our product, we take important information\'s such as the PM levels we get from our sensor\'s and send it to our database and show it on our App. And as you would also know our App can also control the fan speed.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Thank You!',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'For using AirBox :)',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}