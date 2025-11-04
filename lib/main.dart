import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Devices",
                    style: TextStyle(
                      fontSize: 38,
                      color: Color.fromARGB(255, 93, 73, 54),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const Text(
                    "Discover Eunoia Devices",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 93, 73, 54),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

