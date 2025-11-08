import 'package:eunoia_app/components/home/device/device_card.dart';
import 'package:eunoia_app/hooks/use_websocket_state.dart';
import 'package:flutter/material.dart';

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
              UseWebsocketState.availableWiFiAccessPoints,
              UseWebsocketState.connectedState,
            ]),
            builder: (BuildContext context, _) {
              if (UseWebsocketState.availableWiFiAccessPoints.value.isNotEmpty) {
                Set<String> devicesName = {};
                List<DeviceCard> devicesList = [];

                // Add the scan results
                devicesList.addAll(
                  UseWebsocketState.availableWiFiAccessPoints.value
                      .map((accessPoint) {
                        String deviceName = accessPoint.ssid;
                        bool isEunoiaDevice = accessPoint.ssid.startsWith("EUNOIA-BOX-");

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
                          accessPointDevice: accessPoint,
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
