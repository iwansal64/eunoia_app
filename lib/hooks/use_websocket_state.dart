import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wifi_scan/wifi_scan.dart';

class EunoiaDeviceData {
  final WiFiAccessPoint accessPoint;
  final WebSocketChannel wsChannel;

  const EunoiaDeviceData({ required this.accessPoint, required this.wsChannel });
}

class UseWebsocketState {
  static ValueNotifier<WebSocketChannel?> choosenChannel = ValueNotifier(null);
  static ValueNotifier<bool> scanState = ValueNotifier(false);
  static ValueNotifier<bool> connectedState = ValueNotifier(false);
  static ValueNotifier<bool> connectingState = ValueNotifier(false);
  static ValueNotifier<EunoiaDeviceData?> choosenDevice = ValueNotifier(null);

  static ValueNotifier<List<WiFiAccessPoint>> availableWiFiAccessPoints = ValueNotifier([]);

  static void setChoosenChannel(WebSocketChannel? ws) {
    UseWebsocketState.choosenChannel.value = ws;
  }
  
  static void setScanState(bool newState) {
    UseWebsocketState.scanState.value = newState;
  }

  static void setConnectedState(bool newState) {
    UseWebsocketState.connectedState.value = newState;
  }

  static void setConnectingState(bool newState) {
    UseWebsocketState.connectingState.value = newState;
  }

  static void setAvailableWiFiAccessPoints(List<WiFiAccessPoint> newValue) {
    UseWebsocketState.availableWiFiAccessPoints.value = newValue;
  }
}