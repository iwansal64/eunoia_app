import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:eunoia_app/hooks/use_toast_state.dart';
import 'package:eunoia_app/hooks/use_websocket_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:network_info_plus/network_info_plus.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final WiFiAccessPoint accessPointDevice;
  final bool isEunoiaDevice;
  final bool isConnected;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.accessPointDevice,
    this.isConnected = false,
    this.isEunoiaDevice = false
  });

  Future<void> connectToDevice() async {
    if(!isEunoiaDevice) {
      UseToastState.showToast("Error!", "Can't connect to an unknown device. Try again with verified Eunoia device!", duration: Duration(seconds: 5));
      return;
    }
    
    final Logger logger = Logger();

    try {
      logger.i("CONNECTING..");
      
      // Set connecting state to true
      UseWebsocketState.setConnectingState(true);

      // Show toast to inform user that its currently connecting
      UseToastState.showToast("Connecting", "Connecting to $deviceName");

      // Connect to the bluetooth device
      final connected = await WiFiForIoTPlugin.connect(
        accessPointDevice.ssid,
        bssid: accessPointDevice.bssid,
        password: "AlafAS71jXF92mC", // optional if open network
        security: NetworkSecurity.WPA,
        joinOnce: true,
        withInternet: false, // typically ESP32 softAP has no internet
      );

      
      // If the bluetooth device is connected
      if(connected) {
        final info = NetworkInfo();

        // Creatte websocket channel
        String? gateWayIP = await info.getWifiGatewayIP();
        if(gateWayIP == null) {
          UseToastState.showToast("Error", "The device doesn't give default gateway IP (aww mann) :<");
          return;
        }

        WebSocketChannel ws = WebSocketChannel.connect(Uri.parse("${gateWayIP.toString}/ws"));
        UseWebsocketState.setChoosenChannel(ws);
        
        // Show succeess message
        UseToastState.showToast("Success!", "Connected to $deviceName");

        // Wait several seconds before changing page
        await Future.delayed(Duration(seconds: 2));
        
        UsePageState.setPageState(PageType.monitor);
      }
      // If its not connected
      else {
        UseToastState.showToast("Can't connect", "$deviceName is not connected.");
      }
    } catch (e) {
      logger.e('[Bluetooth] Error Connecting to the device: $e');
      UseToastState.showToast("Error", "Can't connect to $deviceName");
    } finally {
      UseWebsocketState.setConnectingState(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: UseWebsocketState.connectingState,
      builder: (BuildContext context, _) {
        // Create button that is depends on the status of connecting to a device or not
        return GestureDetector(
          onTap: UseWebsocketState.connectingState.value ? () {} : connectToDevice,
          child: Opacity(
            opacity: UseWebsocketState.connectingState.value ? 0.5 : 1,
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
                              isConnected ? "CONNECTED" : "AVAILABLE",
                              style: TextStyle(
                                height: 1,
                                fontWeight: isConnected ? FontWeight.bold : FontWeight.normal,
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
