// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'menu_items.dart';
// import 'city_items.dart';
import 'package:http/http.dart' as http;

class PageOne extends StatefulWidget { 
  const PageOne ({ Key? key }) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne>{
  late DatabaseReference aqiDb;
  late DatabaseReference fanDb = FirebaseDatabase.instance.ref().child('fan');
  late double fan_value = 0;
  late num AQI_value;
  late num pm10_value;
  late num pm25_value;
  num jakarta_AQI = 0;

  _PageOneState() {
    aqiDb = FirebaseDatabase.instance.ref().child('AQI');
    // fanDb = FirebaseDatabase.instance.ref().child('fan');
    AQI_value = 0;
    pm10_value = 0;
    pm25_value = 0;
    aqiDb.child('value').onValue.listen((event) {
    if (event.snapshot.value != null) {
      print("Received value from database: ${event.snapshot.value}");
      setState(() {
        AQI_value = event.snapshot.value as num;
    });
  } else {
    print("Received null value from database");
  }
  }); 

  aqiDb.child('pm10').onValue.listen((event) {
    if (event.snapshot.value != null) {
      print("Received value from database: ${event.snapshot.value}");
      setState(() {
        pm10_value = event.snapshot.value as num;
    });
  } else {
    print("Received null value from database");
  }
  }); 

  aqiDb.child('pm25').onValue.listen((event) {
    if (event.snapshot.value != null) {
      print("Received value from database: ${event.snapshot.value}");
      setState(() {
        pm25_value = event.snapshot.value as num;
    });
  } else {
    print("Received null value from database");
  }
  }); 
  }

  @override
  void initState() {        //so getAqi function only gets ran once after opening page and doesnt keep running after every build 
    super.initState();
    getAqi();
  }

  Future<void> getAqi() async {
    try {
      var response = await http.get(Uri.https('api.waqi.info', '/feed/jakarta/', {'token': '92c5c4d26c9010320f5cf824e4808aaf99eb1621'}),);
      var jsonData = jsonDecode(response.body);

      num cityAqi = jsonData['data']['aqi'];
      setState(() {
        jakarta_AQI = cityAqi;
      });
      print('CITY AQI IS: $cityAqi');
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  String AQI_Index() {
    if (AQI_value <= 50) {
      return 'Good';
    } else if (AQI_value <= 100) {
      return 'Moderate';
    } else if (AQI_value <= 150) {
      return 'Unhealthy for Sensitive Groups';
    } else if (AQI_value <= 200) {
      return 'Unhealthy';
    } else if (AQI_value <= 300) {
      return 'Very Unhealthy';
    } else {
      return 'Hazardous';
    }
  }

  String City_AQI_Index() {
    if (jakarta_AQI <= 50) {
      return 'Good';
    } else if (jakarta_AQI <= 100) {
      return 'Moderate';
    } else if (jakarta_AQI <= 150) {
      return 'Unhealthy for Sensitive Groups';
    } else if (jakarta_AQI <= 200) {
      return 'Unhealthy';
    } else if (jakarta_AQI <= 300) {
      return 'Very Unhealthy';
    } else {
      return 'Hazardous';
    }
  }

  void fanSpeed() {
    double fanToggle = 0;
    setState(() {
      fanToggle = fan_value;
    });
    fanDb.update({'speed': fanToggle})
    .then((value) => print('fan Toggled'))
    .catchError((error) => print('Failed to update boolean value: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 35),
              Align(
                alignment: Alignment.topLeft,
                  child: Container(
                    height: 402,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                          Container(
                            decoration: BoxDecoration( 
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(15),            
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],                    
                        ),                  
                        width: 355,
                        height: 402,
                        margin: EdgeInsets.only(left: 23),
                        padding: EdgeInsets.symmetric(horizontal:40, vertical: 15),
                        child: Column(
                          children: [
                            // Image.asset('assets/images/bedroom.jpg'),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Bedroom',                      
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, 
                                  fontSize: 30),           
                                ),
                            ),
                            SizedBox(height: 30),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(' AQI',                      
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white, 
                                  fontSize: 25)           
                                ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('$AQI_value',                      
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, 
                                  fontSize: 70)           
                                ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Text(AQI_Index(),                      
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, 
                                    fontSize: 25)           
                                  ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  children: [
                                    Text('Detail info',                      
                                      style: GoogleFonts.plusJakartaSans(
                                        color: Colors.white, 
                                        fontSize: 18)           
                                      ),
                                    SizedBox(width: 5),
                                    Transform.translate(
                                      offset: Offset(0, 2),
                                      child: Builder(
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => showPopover(
                                              context: context, 
                                              bodyBuilder: (context) => MenuItems(),
                                              height: 120,
                                              width: 200,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_outlined, 
                                              color: Colors.white, size: 20
                                            ),
                                          );
                                        }
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ), 
                      ),             
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration( 
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                            ),
                          ],
                        ),
                          width: 355,
                          height: 402,
                          padding: EdgeInsets.symmetric(horizontal:40, vertical: 15),
                          child: Column(
                          children: [
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Jakarta',                      
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, 
                                  fontSize: 30),           
                                ),
                            ),
                            SizedBox(height: 30),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(' AQI',                      
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white, 
                                  fontSize: 25)           
                                ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('$jakarta_AQI',                      
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, 
                                  fontSize: 70)           
                                ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Text(City_AQI_Index(),                      
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, 
                                    fontSize: 25)           
                                  ),
                              ),
                            ),
                            SizedBox(height: 35),
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(horizontal: 4),
                            //     child: Row(
                            //       children: [
                            //         Text('Detail info',                      
                            //           style: GoogleFonts.plusJakartaSans(
                            //             color: Colors.white, 
                            //             fontSize: 18)           
                            //           ),
                            //         SizedBox(width: 5),
                            //         Transform.translate(
                            //           offset: Offset(0, 2),
                            //           child: Builder(
                            //             builder: (context) {
                            //               return GestureDetector(
                            //                 onTap: () => showPopover(
                            //                   context: context, 
                            //                   bodyBuilder: (context) => CityItems(),
                            //                   height: 120,
                            //                   width: 200,
                            //                 ),
                            //                 child: Icon(
                            //                   Icons.arrow_forward_outlined, 
                            //                   color: Colors.white, size: 20
                            //                 ),
                            //               );
                            //             }
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        ),
                      )
                      ],
                    ),
                  ),                
              ),
              SizedBox(height: 30),
              Row(              
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(    
                      margin: EdgeInsets.only(left: 0),              
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),       
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],           
                      ),
                      height: 80,
                      width: 165,                      
                      child: Column(
                        children: [
                          const SizedBox(height: 14),
                          Text('PM 2.5', style: GoogleFonts.plusJakartaSans(
                            color: Colors.indigo, 
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text('$pm25_value µg/m3', style: GoogleFonts.plusJakartaSans(
                            color: Colors.indigo, 
                            fontSize: 17,
                            // fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),        
                    ),
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.of(context).pushNamed('/pm10');
                    // },
                    child:
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),       
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],           
                        ),
                        height: 80,
                        width: 165,    
                        child: Column(
                          children: [
                            const SizedBox(height: 14),
                            Text('PM 10', style: GoogleFonts.plusJakartaSans(
                              color: Colors.indigo, 
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text('$pm10_value µg/m3', style: GoogleFonts.plusJakartaSans(
                              color: Colors.indigo, 
                              fontSize: 17,
                              // fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),            
                      ),
                    ),
                  ),
                ],
              ),          
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Align(
                  // alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),       
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],           
                    ),
                    width: 355,
                    margin: EdgeInsets.only(right: 33),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(' Fan Speed', style: GoogleFonts.plusJakartaSans(
                              color: Colors.indigo, 
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                        Transform.translate(
                          offset: Offset(0, -3),
                          child: Slider(
                            activeColor: Colors.indigo,
                            inactiveColor: Colors.indigo.shade200,
                            value: fan_value, 
                            min: 0,
                            max: 3,
                            divisions: 3,
                            label: fan_value.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                fan_value = value;
                                print('fan value: $fan_value');
                                // fanSpeed();
                              });
                              fanSpeed();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Transform.translate(
                            offset: Offset(0, -12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(' Off', style: GoogleFonts.plusJakartaSans(
                                  color: Colors.indigo, 
                                  fontSize: 15,
                                ),
                              ),
                                Text(' Low', style: GoogleFonts.plusJakartaSans(
                                  color: Colors.indigo, 
                                  fontSize: 15,
                                ),
                              ),
                                Text(' Medium', style: GoogleFonts.plusJakartaSans(
                                  color: Colors.indigo, 
                                  fontSize: 15,
                                ),
                              ),    
                                Text(' High', style: GoogleFonts.plusJakartaSans(
                                  color: Colors.indigo, 
                                  fontSize: 15,
                                ),
                              ),                  
                            ],
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
      ),
    );
  }
}