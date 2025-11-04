import 'package:flutter/material.dart';

class DeviceTitle extends StatelessWidget {
  const DeviceTitle({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}