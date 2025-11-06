import 'package:eunoia_app/components/home/setting/setting_title.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SettingTitle(),
        ],
      ),
    );
  }
}