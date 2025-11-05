import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/hooks/use_toast_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: ListenableBuilder(
            listenable: UseBluetoothState.scanResults,
            builder: (BuildContext context, _) {
              if (UseBluetoothState.scanResults.value.isNotEmpty) {
                Set<String> devicesName = {};

                // Shows the available devices data
                return Column(
                  spacing: 15,
                  children: UseBluetoothState.scanResults.value.map((
                    scanResult,
                  ) {
                    String deviceName = scanResult.device.platformName.isNotEmpty ? scanResult.device.platformName : scanResult.device.advName;
                    
                    // If the device name is empty
                    if(deviceName.isEmpty) return null;

                    // If there's duplicates
                    String tempDeviceName = deviceName;
                    int postfix = 1;
                    while(devicesName.contains(tempDeviceName)) {
                      tempDeviceName = "$deviceName ($postfix)";
                      postfix += 1;
                    }

                    devicesName.add(tempDeviceName);
                    
                    return DeviceCard(
                      deviceName: tempDeviceName,
                      bluetoothDevice: scanResult.device,
                    );
                  }).whereType<DeviceCard>().toList(),
                );
              }

              return Center(
                child: const Text("There's no devices"),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final DateTime? lastSeen;
  final BluetoothDevice bluetoothDevice;

  Future<void> connectToDevice() async {
    final Logger logger = Logger();

    try {
      // await bluetoothDevice.connect(license: License.free, autoConnect: true);
      UseToastState.showToast("TEST", "YOO");
      logger.i('[Bluetooth] Show toast');
    } catch (e) {
      logger.e('[Bluetooth] Error connecting: $e');
    }
  }

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.bluetoothDevice,
    this.lastSeen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: connectToDevice,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 93, 73, 54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Color.fromARGB(255, 246, 242, 229),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      deviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Spacer(),
                  (lastSeen != null
                      ? (Container(
                          alignment: Alignment.bottomRight,
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(lastSeen.toString()),
                          ),
                        ))
                      : (Container(
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            "ONLINE",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
