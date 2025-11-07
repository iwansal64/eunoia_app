import 'package:flutter/material.dart';

class AboutTitle extends StatelessWidget {
  const AboutTitle({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Microsleep",
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
          const Text(
            "Tidur singkat yang membahayakan kesalamatan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}