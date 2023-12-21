// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({ Key? key }) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  late DatabaseReference aqiDb;
  late num AQI_valuee = 0;

  _MenuItemsState () {
    aqiDb = FirebaseDatabase.instance.ref().child('AQI');
    aqiDb.child('value').onValue.listen((event) {
    if (event.snapshot.value != null) {
      print("Received value from database: ${event.snapshot.value}");
      setState(() {
        AQI_valuee = event.snapshot.value as num;
    });
  } else {
    print("Received null value from database");
  }
  }); 
  }

  String Detail() {
    if (AQI_valuee <= 50) {
      return 'Air quality is satisfactory, and air pollution poses little or no risk.';
    } else if (AQI_valuee <= 100) {
      return 'Air quality is acceptable but, some pollutants may be a concern for sensitive people';
    } else if (AQI_valuee <= 150) {
      return 'sensitive groups may experience health effects, however the general population is unlikely to be affected';
    } else if (AQI_valuee <= 200) {
      return 'Everyone may begin to experience health effects, and sensitive groups may experience more serious effects.';
    } else if (AQI_valuee <= 300) {
      return 'Health alert, everyone may experience more serious health effects.';
    } else {
      return 'Health warnings of emergency conditions; the entire population is more likely to be affected.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 200,
          color: Colors.indigo.shade50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Detail(),
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.indigo,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

