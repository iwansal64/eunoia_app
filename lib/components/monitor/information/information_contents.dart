import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:flutter/material.dart';

class InformationContents extends StatelessWidget {
  const InformationContents({ super.key });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ListenableBuilder(
            listenable: UseBluetoothState.choosenDevice,
            builder: (BuildContext context, _) {

              if(UseBluetoothState.choosenDevice.value == null) {
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
                  children: [
                    Icon(UseBluetoothState.choosenDevice.value!.isConnected ? Icons.watch : Icons.watch_off),
                    Column(
                      children: [
                        
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