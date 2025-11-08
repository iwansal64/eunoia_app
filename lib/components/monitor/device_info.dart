import 'package:eunoia_app/hooks/use_websocket_state.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({ super.key });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListenableBuilder(
            listenable: Listenable.merge([UseWebsocketState.choosenDevice, UseWebsocketState.connectedState]),
            builder: (BuildContext context, _) {
              EunoiaDeviceData? eunoiaDeviceData = UseWebsocketState.choosenDevice.value;

              if(eunoiaDeviceData == null) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text("Device is not specified"),
                  ),
                );
              }

              return Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(UseWebsocketState.connectedState.value ? Icons.watch : Icons.watch_off, size: 54,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eunoiaDeviceData.accessPoint.ssid,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Icon(UseWebsocketState.connectedState.value ? Icons.check : Icons.clear),
                            Text(
                              UseWebsocketState.connectedState.value ? "Connected!" : "Not Connected"
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}