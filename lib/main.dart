import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eunoia_app/components/device/device_list.dart';
import 'package:eunoia_app/components/device/title.dart';
import 'package:eunoia_app/components/globals/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.sairaTextTheme()
      ),
      home: Scaffold(
        body: DefaultTextStyle(
          style: GoogleFonts.saira(
            textStyle: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 93, 73, 54),
              decoration: TextDecoration.none
            )
          ),
          child: const DevicePage()
        ),
      ),
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                children: [
                  DeviceTitle(),
                  SizedBox(height: 30,),
                  Expanded(child: DeviceList()),
                ],
              ),
            ),
          ),
          Navbar()
        ],
      ),
    );
  }
}

