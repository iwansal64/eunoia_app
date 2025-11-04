import 'package:flutter/material.dart';

class DeviceTitle extends StatelessWidget {
  const DeviceTitle({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Devices",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700
            ),
          ),
          const Text(
            "Discover Eunoia Devices",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}