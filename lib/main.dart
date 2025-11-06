import 'package:eunoia_app/components/globals/toast.dart';
import 'package:eunoia_app/pages/home.dart';
import 'package:eunoia_app/pages/monitor.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:eunoia_app/util/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {    
    super.initState();
    checkBluetoothPermission();
  }

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
            child: SafeArea(
              child: Stack(
                children: [
                  const PageController(), 
                  Toast(),
                ]
              )
            ),
          ),
      )
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
      child: ListenableBuilder(
        listenable: UsePageState.pageState,
        builder: (BuildContext context, _) {
          switch (UsePageState.pageState.value) {
            case PageType.home:
              return HomePage();
            case PageType.monitor:
              return MonitorPage();
          }
        }
      ),
    );
  }
}

