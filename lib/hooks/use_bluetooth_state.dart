import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class UseBluetoothState {
  static ValueNotifier<bool> scanState = ValueNotifier(false);
  static ValueNotifier<Set<ScanResult>> scanResults = ValueNotifier({});

  static void setScanState(bool newState) {
    if(scanState.value == newState) return;
    UseBluetoothState.scanState.value = newState;
  }

  static void setScanResult(Set<ScanResult> newScanResult) {
    UseBluetoothState.scanResults.value = newScanResult;
  }

  static void resetScanResult() {
    UseBluetoothState.scanResults.value = {};
  }
}