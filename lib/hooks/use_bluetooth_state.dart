import 'package:flutter/foundation.dart';

class UseBluetoothState {
  static ValueNotifier<bool> scanState = ValueNotifier(false);

  static void setScanState(bool newState) {
    if(scanState.value == newState) return;
    UseBluetoothState.scanState.value = newState;
  }
}