import 'package:flutter/material.dart';

class MonitorTitle extends StatelessWidget {
  const MonitorTitle({ super.key });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sensor Data",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
          const Text(
            "Realtime Heart-rate Monitor",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1
            ),
          )
        ],
      ),
    );
  }
}