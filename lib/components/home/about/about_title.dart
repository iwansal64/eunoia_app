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
            "About",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
          const Text(
            "What is Microsleep?",
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