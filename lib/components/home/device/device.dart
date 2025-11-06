import 'package:eunoia_app/components/home/device/device_list.dart';
import 'package:eunoia_app/components/home/device/device_title.dart';
import 'package:eunoia_app/components/home/device/scan_device.dart';
import 'package:flutter/material.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          DeviceTitle(),
          SizedBox(height: 30,),
          Expanded(child: DeviceList()),
          SizedBox(height: 10,),
          ScanDeviceButton()
        ],
      ),
    );
  }
}