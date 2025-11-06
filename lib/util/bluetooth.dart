import 'package:flutter_blue_plus/flutter_blue_plus.dart';

String getBluetoothDeviceName(BluetoothDevice device) {
  return device.platformName.isNotEmpty ? device.platformName : device.advName;
}