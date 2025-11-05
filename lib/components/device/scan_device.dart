import 'package:eunoia_app/hooks/use_bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class ScanDeviceButton extends StatelessWidget {
  const ScanDeviceButton({ super.key });

  @override
  Widget build(BuildContext context) {
    final logger = Logger();

    void scan() async {
      if(UseBluetoothState.scanState.value) return;
      
      logger.i("SCANNING..");
      UseBluetoothState.setScanState(true);

      await Future.delayed(Duration(seconds: 2));
      
      UseBluetoothState.setScanState(false);
    }
    
    return ListenableBuilder(
      listenable: UseBluetoothState.scanState,
      builder: (BuildContext context, _) {

        return GestureDetector(
          onTap: UseBluetoothState.scanState.value ? () {} : scan,
          child: Opacity(
            opacity: UseBluetoothState.scanState.value ? 0.5 : 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 242, 229),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: const Text("Scan!"),
              ),
            ),
          ),
        );
      },
    );
  }
}