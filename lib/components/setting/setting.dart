import 'package:eunoia_app/components/setting/setting_title.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Column(
          children: [
            SettingTitle(),
          ],
        ),
      ),
    );
  }
}