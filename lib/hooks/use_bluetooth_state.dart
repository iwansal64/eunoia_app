import 'package:eunoia_app/util/bluetooth_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class EunoiaDeviceData {
  final BluetoothDevice bluetoothDevice;
  final String deviceName;

  const EunoiaDeviceData({ required this.bluetoothDevice, required this.deviceName });
}

class UseBluetoothState {
  static ValueNotifier<bool> scanState = ValueNotifier(false);
  static ValueNotifier<bool> connectingState = ValueNotifier(false);
  static ValueNotifier<bool> connectedState = ValueNotifier(false);
  static ValueNotifier<EunoiaDeviceData?> choosenDevice = ValueNotifier(null);
  static ValueNotifier<Set<ScanResult>> scanResults = ValueNotifier({});
  

  // Functions
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
    UseBluetoothState.choosenDevice.value = device != null ? EunoiaDeviceData(
      bluetoothDevice: device,
      deviceName: getBluetoothDeviceName(device)
    ) : null;
  }

  static void setConnectedState(bool newState) {
    UseBluetoothState.connectedState.value = newState;
  }
}