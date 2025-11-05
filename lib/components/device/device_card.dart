import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/hooks/use_toast_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/web.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final DateTime? lastSeen;
  final BluetoothDevice bluetoothDevice;

  Future<void> connectToDevice() async {
    final Logger logger = Logger();

    try {
      UseBluetoothState.setConnectingState(true);
      UseToastState.showToast("Connecting", "Connecting to $deviceName");
      // await bluetoothDevice.connect(license: License.free, autoConnect: true);
      await Future.delayed(Duration(seconds: 2));
      logger.i("SUCCESS!");
      UseToastState.showToast("Success!", "Connected to $deviceName");
    } catch (e) {
      logger.e('[Bluetooth] Error Connecting to the device: $e');
      UseToastState.showToast("Error", "Can't connect to $deviceName");
    } finally {
      UseBluetoothState.setConnectingState(false);
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
    return ListenableBuilder(
      listenable: UseBluetoothState.connectingState,
      builder: (BuildContext context, _) {
        return GestureDetector(
          onTap: UseBluetoothState.connectingState.value ? () {} : connectToDevice,
          child: Opacity(
            opacity: UseBluetoothState.connectingState.value ? 0.5 : 1,
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
          ),
        );
      }
    );
  }
}
