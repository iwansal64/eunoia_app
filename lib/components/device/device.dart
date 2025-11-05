import 'package:eunoia_app/components/device/device_list.dart';
import 'package:eunoia_app/components/device/title.dart';
import 'package:flutter/material.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            DeviceTitle(),
            SizedBox(height: 30,),
            Expanded(child: DeviceList()),
          ],
        ),
      ),
    );
  }
}