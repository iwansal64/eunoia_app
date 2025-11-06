import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:flutter/material.dart';

class InformationContents extends StatelessWidget {
  const InformationContents({ super.key });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListenableBuilder(
            listenable: Listenable.merge([UseBluetoothState.choosenDevice, UseBluetoothState.connectedState]),
            builder: (BuildContext context, _) {
              EunoiaDeviceData? eunoiaDeviceData = UseBluetoothState.choosenDevice.value;

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
                    Icon(eunoiaDeviceData.bluetoothDevice.isConnected ? Icons.watch : Icons.watch_off, size: 54,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eunoiaDeviceData.deviceName,
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
                            Icon(eunoiaDeviceData.bluetoothDevice.isConnected ? Icons.check : Icons.clear),
                            Text(
                              eunoiaDeviceData.bluetoothDevice.isConnected ? "Connected!" : "Not Connected"
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