import 'package:eunoia_app/components/home/device/device_card.dart';
import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/util/bluetooth_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: ListenableBuilder(
            listenable: Listenable.merge([
              UseBluetoothState.scanResults,
              UseBluetoothState.connectedState,
            ]),
            builder: (BuildContext context, _) {
              if (UseBluetoothState.scanResults.value.isNotEmpty) {
                Set<String> devicesName = {};
                List<DeviceCard> devicesList = [];

                // Add the scan results
                devicesList.addAll(
                  UseBluetoothState.scanResults.value
                      .map((scanResult) {
                        String deviceName = getBluetoothDeviceName(
                          scanResult.device,
                        );
                        bool isEunoiaDevice = scanResult
                            .advertisementData
                            .serviceUuids
                            .contains(
                              Guid("6edda78e-092b-47d9-8eb8-3199598c5515"),
                            );

                        // If the device name is empty
                        if (deviceName.isEmpty) return null;

                        // If there's duplicates
                        String tempDeviceName = deviceName;
                        int postfix = 1;
                        while (devicesName.contains(tempDeviceName)) {
                          tempDeviceName = "$deviceName ($postfix)";
                          postfix += 1;
                        }

                        devicesName.add(tempDeviceName);

                        return DeviceCard(
                          deviceName: tempDeviceName,
                          bluetoothDevice: scanResult.device,
                          isEunoiaDevice: isEunoiaDevice,
                        );
                      })
                      .whereType<DeviceCard>()
                      .toList(),
                );

                // Add current connected devices
                


                // Shows the available devices data
                return Column(spacing: 15, children: devicesList);
              }

              return Center(child: const Text("There's no devices"));
            },
          ),
        ),
      ),
    );
  }
}
