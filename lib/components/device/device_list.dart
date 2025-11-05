import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ListenableBuilder(
              listenable: UseBluetoothState.scanResults,
              builder: (BuildContext context, _) {
                if (UseBluetoothState.scanResults.value.isNotEmpty) {
                  return Column(
                    spacing: 15,
                    children: UseBluetoothState.scanResults.value.map((
                      scanResult,
                    ) {
                      return DeviceCard(
                        deviceName: scanResult.device.platformName,
                        bluetoothDevice: scanResult.device,
                      );
                    }).toList(),
                  );
                }

                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 242, 229),
                    ),
                    child: const Text("There's no devices"),
                  ),
                );
              },
            ),
          );
        },
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
      await bluetoothDevice.connect(license: License.free, autoConnect: true);
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
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        borderRadius: BorderRadius.circular(10),
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
                  "Device Name: $deviceName",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
