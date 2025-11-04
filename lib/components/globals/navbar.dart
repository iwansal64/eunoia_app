import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Navbar extends StatelessWidget {
  const Navbar({ super.key });

  @override
  Widget build(BuildContext context) {
    final logger = Logger();


    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  logger.i("Information");
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 112, 148, 112)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, color: Colors.white,),
                      const Text(
                        "Information",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  logger.i("Devices");
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 162, 194, 119)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bluetooth, color: Colors.white,),
                      const Text(
                        "Devices",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}