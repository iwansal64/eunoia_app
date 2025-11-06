import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class UseBluetoothState {
  static ValueNotifier<bool> scanState = ValueNotifier(false);
  static ValueNotifier<bool> connectingState = ValueNotifier(false);
  static ValueNotifier<BluetoothDevice?> choosenDevice = ValueNotifier(null);
  static ValueNotifier<Set<ScanResult>> scanResults = ValueNotifier({});

  static void setScanState(bool newState) {
    if(UseBluetoothState.scanState.value == newState) return;
    UseBluetoothState.scanState.value = newState;
  }

  static void setConnectingState(bool newState) {
    if(UseBluetoothState.connectingState.value == newState) return;
    UseBluetoothState.connectingState.value = newState;
  }

  static void setScanResult(Set<ScanResult> newScanResult) {
    UseBluetoothState.scanResults.value = newScanResult;
  }

  static void resetScanResult() {
    UseBluetoothState.scanResults.value = {};
  }

  static void setChoosenDevice(BluetoothDevice? device) {
    UseBluetoothState.choosenDevice.value = device;
  }
}