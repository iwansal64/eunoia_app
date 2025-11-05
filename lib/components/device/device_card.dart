import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:eunoia_app/hooks/use_toast_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/web.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final BluetoothDevice bluetoothDevice;
  final bool isEunoiaDevice;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.bluetoothDevice,
    this.isEunoiaDevice = false
  });

  Future<void> connectToDevice() async {
    final Logger logger = Logger();

    try {
      // Set connecting state to true
      UseBluetoothState.setConnectingState(true);

      // Show toast to inform user that its currently connecting
      UseToastState.showToast("Connecting", "Connecting to $deviceName");

      // Connect to the bluetooth device
      await bluetoothDevice.connect(license: License.free, mtu: 512);
      
      // If the bluetooth device is connected
      if(bluetoothDevice.isConnected) {
        // Show succeess message
        UseToastState.showToast("Success!", "Connected to $deviceName");

        // Wait several seconds before changing page
        await Future.delayed(Duration(seconds: 2));
        
        // Change page
        UsePageState.pageState.value = PageType.monitor;
      }
      // If its not connected
      else {
        UseToastState.showToast("Can't connect", "$deviceName is not connected.");
      }
    } catch (e) {
      logger.e('[Bluetooth] Error Connecting to the device: $e');
      UseToastState.showToast("Error", "Can't connect to $deviceName");
    } finally {
      UseBluetoothState.setConnectingState(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: UseBluetoothState.connectingState,
      builder: (BuildContext context, _) {

        // Create button that is depends on the status of connecting to a device or not
        return GestureDetector(
          onTap: UseBluetoothState.connectingState.value ? () {} : connectToDevice,
          child: Opacity(
            opacity: UseBluetoothState.connectingState.value ? 0.5 : 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
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
                          deviceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(isEunoiaDevice ? Icons.verified : Icons.dangerous, size: 14, color: isEunoiaDevice ? Color.fromARGB(255, 112, 148, 112) : Color.fromARGB(255, 93, 73, 54),),
                                Text(
                                  isEunoiaDevice ? "Verified Eunoia Device" : "Unknown Device",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isEunoiaDevice ? Color.fromARGB(255, 112, 148, 112) : Color.fromARGB(255, 93, 73, 54)
                                  ),
                                )
                              ],
                            ),
                            Text(
                              bluetoothDevice.isConnected ? "CONNECTED" : "AVAILABLE",
                              style: TextStyle(
                                height: 1,
                                fontWeight: bluetoothDevice.isConnected ? FontWeight.bold : FontWeight.normal,
                                color: isEunoiaDevice ? Color.fromARGB(255, 112, 148, 112) : Color.fromARGB(255, 93, 73, 54),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
        );
      }
    );
  }
}
