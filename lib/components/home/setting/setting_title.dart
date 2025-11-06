import 'package:flutter/material.dart';

class SettingTitle extends StatelessWidget {
  const SettingTitle({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Setting",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w700,
              height: 1
            ),
          ),
        ],
      ),
    );
  }
}