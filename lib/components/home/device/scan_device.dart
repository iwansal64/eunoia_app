import 'dart:async';

import 'package:eunoia_app/hooks/use_websocket_state.dart';
import 'package:eunoia_app/util/permission_util.dart';
import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';


class ScanDeviceButton extends StatefulWidget {
  const ScanDeviceButton({ super.key });

  @override
  State<StatefulWidget> createState() => _ScanDeviceButtonState();
}

class _ScanDeviceButtonState extends State<ScanDeviceButton> {
  StreamSubscription<List<WiFiAccessPoint>>? _scanSubscription;

  @override void dispose() {
    if(_scanSubscription != null) {
      _scanSubscription!.cancel().whenComplete(() {
        super.dispose();
      });
      _scanSubscription = null;
    }
  }

  @override
  Widget build(BuildContext context) {

    Future<void> startScan() async {
      if(_scanSubscription != null) {
        _scanSubscription!.cancel();
        _scanSubscription = null;
      }

      UseWebsocketState.setScanState(true);
      
      if(!(await checkPermission())) return;
      
      if(UseWebsocketState.scanState.value) return;

      WiFiScan.instance.startScan();
      _scanSubscription = WiFiScan.instance.onScannedResultsAvailable.listen((List<WiFiAccessPoint> accessPoints) {
        UseWebsocketState.setAvailableWiFiAccessPoints(accessPoints);
      });
    }

    Future<void> stopScan() async {
      if(_scanSubscription != null) {
        await _scanSubscription!.cancel();
        _scanSubscription = null;
      }
      UseWebsocketState.setScanState(false);
    }

    return ListenableBuilder(
      listenable: UseWebsocketState.scanState,
      builder: (BuildContext context, _) {

        return GestureDetector(
          onTap: UseWebsocketState.scanState.value ? stopScan : startScan,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 242, 229),
              border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(UseWebsocketState.scanState.value ? Icons.wifi_off : Icons.wifi),
                      Text(UseWebsocketState.scanState.value ? "Stop Scan" : "Start Scan"),
                    ],
                  ),
                )
              ),
            ),
          ),
        );
      },
    );
  }
}