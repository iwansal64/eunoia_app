import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:flutter/material.dart';

class DisconnectDevice extends StatelessWidget {
  const DisconnectDevice({ super.key });

  Future<void> disconnect() async {
    EunoiaDeviceData? choosenDevice = UseBluetoothState.choosenDevice.value;
    if(choosenDevice != null && choosenDevice.bluetoothDevice.isConnected) {
      await choosenDevice.bluetoothDevice.disconnect();
    }

    UsePageState.setPageState(PageType.home);
  }
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: disconnect,
        child: ListenableBuilder(
          listenable: UseBluetoothState.choosenDevice, 
          builder: (BuildContext context, _) {
            
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 242, 229),
                border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
                borderRadius: BorderRadius.circular(35)
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: const Text("Disconnect"),
              ),
            );
          }
        ),
    );
  }
}