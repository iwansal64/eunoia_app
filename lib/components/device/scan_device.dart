import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/util/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/web.dart';

class ScanDeviceButton extends StatelessWidget {
  const ScanDeviceButton({ super.key });

  @override
  Widget build(BuildContext context) {
    final logger = Logger();

    Future<void> startScan() async {
      // Check bluetooth permission
      if(!(await checkBluetoothPermission())) return;
      
      // If it's currently scanning
      if(UseBluetoothState.scanState.value) return;
      UseBluetoothState.setScanState(true);

      // Reset the scanning result
      UseBluetoothState.resetScanResult();
      
      // If not scanning, start scanning
      if(!FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.startScan();
      }

      // Listen to scan results
      FlutterBluePlus.scanResults.listen((results) {
        UseBluetoothState.setScanResult(results.toSet());
        logger.i(results);
      });

      // Wait for scanning to stop
      await Future.delayed(Duration(seconds: 4));
      UseBluetoothState.resetScanResult();
    }

    void stopScan() async {
      if(!UseBluetoothState.scanState.value) return;
      UseBluetoothState.setScanState(false);

      if(FlutterBluePlus.isScanningNow) {
        FlutterBluePlus.stopScan();
      }
    }
    
    return ListenableBuilder(
      listenable: UseBluetoothState.scanState,
      builder: (BuildContext context, _) {

        return GestureDetector(
          onTap: UseBluetoothState.scanState.value ? stopScan : startScan,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 242, 229),
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
                      Icon(UseBluetoothState.scanState.value ? Icons.bluetooth_disabled_outlined : Icons.bluetooth_connected_outlined),
                      Text(UseBluetoothState.scanState.value ? "Stop Scan" : "Start Scan")
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