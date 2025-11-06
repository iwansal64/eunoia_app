import 'package:eunoia_app/components/monitor/disconnect_device.dart';
import 'package:flutter/material.dart';
import 'package:eunoia_app/components/monitor/device_info.dart';
import 'package:eunoia_app/components/monitor/monitor_title.dart';
import 'package:eunoia_app/components/monitor/data_summary.dart';

class MonitorPage extends StatelessWidget {
  const MonitorPage({ super.key });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    MonitorTitle(),
                    SizedBox(height: 15,),
                    DeviceInfo(),
                    DataSummary(),
                    Spacer(),
                    DisconnectDevice(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}