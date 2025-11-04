import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miti_app/components/device/title.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.sairaTextTheme()
      ),
      home: const DevicePage(),
    );
  }
}

class DevicePage extends StatelessWidget {
  const DevicePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          DeviceTitle(),
                   
        ],
      )
    );
  }
}

