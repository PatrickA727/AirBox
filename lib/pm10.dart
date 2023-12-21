import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class PmTen extends StatefulWidget {
  const PmTen({super.key});

  @override
  State<PmTen> createState() => _PmTenState();
}

class _PmTenState extends State<PmTen> {
  final CollectionReference PMten_value = FirebaseFirestore.instance.collection('pm10');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
        body: 
          Column(
          children: [            
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('Back'),
            ),
          ],
      ),
    );
  }
}