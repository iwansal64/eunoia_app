import 'package:permission_handler/permission_handler.dart';

Future<bool> checkBluetoothPermission() async {
  List<PermissionStatus> bluetoothStatus = (await [
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothScan,
  ].request()).values.toList();

  return bluetoothStatus.every((status) => status.isGranted);
}
