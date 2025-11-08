import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission() async {
  List<PermissionStatus> permissionStatus = (await [
    Permission.location
  ].request()).values.toList();

  return permissionStatus.every((status) => status.isGranted);
}
