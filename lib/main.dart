import 'package:eunoia_app/components/device/device.dart';
import 'package:eunoia_app/components/information/information.dart';
import 'package:eunoia_app/components/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eunoia_app/components/globals/navbar.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';

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
          child: const PageController()
        ),
      ),
    );
  }
}

class PageController extends StatelessWidget {
  const PageController({ super.key });

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
            child: ValueListenableBuilder(
              valueListenable: UsePageState.pageState,
              builder: (BuildContext ctx, var value, _) {
                switch (value) {
                  case PageType.device: 
                    return DevicePage();
                  case PageType.information:
                    return InformationPage();
                  case PageType.settings:
                    return SettingPage();
                }
              }
            ),
          ),
          Navbar()
        ],
      ),
    );
  }
}

