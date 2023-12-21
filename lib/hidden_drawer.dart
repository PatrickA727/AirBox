// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:air_purifier/pageOne.dart';
import 'aqi_explain.dart';
import 'about_us.dart';
import 'package:google_fonts/google_fonts.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Airbox',
          baseStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.indigo,
          ), 
          PageOne(),
        ),        
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'AQI',
            baseStyle: TextStyle(
              color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            ),            
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.indigo,
            ), 
            AQIExplain(),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'About Us',
            baseStyle: TextStyle(
              color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            ),            
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.indigo,
            ), 
            AboutUs(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      leadingAppBar: Transform.translate(
        offset: Offset(-4, 2),
        child: RotatedBox(
          quarterTurns: -135,
          child: Icon(
              Icons.bar_chart_rounded,
              color: Colors.white,
              size: 30,
            ),
        ),
      ),
      elevationAppBar: 0,
      backgroundColorAppBar: Colors.indigo,
      backgroundColorMenu: Colors.indigo.shade300,      
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 35,
      contentCornerRadius: 20,
      styleAutoTittleName: TextStyle(
        color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,             
      ),
      isTitleCentered: true,
    );
  }
}