import 'dart:convert';
import 'package:eunoia_app/hooks/use_data_state.dart';
import 'package:eunoia_app/util/collection_util.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

final String sensorServiceUUID = "6edda78e-092b-47d9-8eb8-3199598c5515";
final String bpmCharacteristicsUUID = "209afaca-46c9-4aa0-8f1a-540e7266ea72";

String getBluetoothDeviceName(BluetoothDevice device) {
  return device.platformName.isNotEmpty ? device.platformName : device.advName;
}

void initializeEunoiaDataCommunication(BluetoothDevice device) async {
  List<BluetoothService> servicesList = [];
  
  // Wait to device to connect
  for (var i = 0; i < 10; i++) {
    try {
      servicesList = await device.discoverServices(timeout: 10);
      if(device.isConnected) break;
    }
    on FlutterBluePlusException catch (_) {
      await Future.delayed(Duration(milliseconds: 500)); 
    }
  }
  
  
  // Find the service
  final BluetoothService? sensorService = findOrNull(servicesList, (service) => service.uuid == Guid(sensorServiceUUID));
  if(sensorService == null) return;

  // Find the characteristic
  final BluetoothCharacteristic? bpmCharacteristic = findOrNull(sensorService.characteristics, (characteristic) => characteristic.uuid == Guid(bpmCharacteristicsUUID));
  if(bpmCharacteristic == null) return;

  // Set notify for the characteristic
  await bpmCharacteristic.setNotifyValue(true);

  // Set callback for characteristic changes
  bpmCharacteristic.lastValueStream.listen((value) {
    // If the value is empty, return
    if(value.isEmpty) return;
    
    // Set a variable to contain the data value
    String data = "";
    
    // Try to decode the value based on UTF-8
    try {
      data = utf8.decode(value);
    } catch (_) {
      // If the value is not UTF-8
      return;
    }

    // Parse the UTF-8 string to a number
    int? dataNumber = int.tryParse(data);

    // If it's not a number, return
    if(dataNumber == null) return;

    // If the data is indeed a number, save to the state
    UseBPMDataState.addBPMData(dataNumber);
  });
}
