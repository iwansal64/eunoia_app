import 'package:flutter/material.dart';

class InformationTitle extends StatelessWidget {
  const InformationTitle({ super.key });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Information",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
          const Text(
            "Device Information",
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