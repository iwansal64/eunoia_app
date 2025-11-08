import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:eunoia_app/hooks/use_websocket_state.dart';
import 'package:flutter/material.dart';

class DisconnectDevice extends StatelessWidget {
  const DisconnectDevice({ super.key });

  Future<void> disconnect() async {
    EunoiaDeviceData? choosenDevice = UseWebsocketState.choosenDevice.value;
    if(choosenDevice != null && UseWebsocketState.connectedState.value) {
      await choosenDevice.wsChannel.sink.close();
    }

    UsePageState.setPageState(PageType.home);
  }
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: disconnect,
        child: ListenableBuilder(
          listenable: Listenable.merge([
            UseWebsocketState.choosenDevice,
            UseWebsocketState.connectedState
          ]), 
          builder: (BuildContext context, _) {

            EunoiaDeviceData? deviceData = UseWebsocketState.choosenDevice.value;
            bool isConnected = UseWebsocketState.connectedState.value;
            
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 242, 229),
                border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
                borderRadius: BorderRadius.circular(35)
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text((deviceData != null && isConnected) ? "Disconnect" : "Back to Menu"),
              ),
            );
          }
        ),
    );
  }
}