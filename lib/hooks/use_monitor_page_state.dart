import 'package:flutter/foundation.dart';

enum MonitorPageType {
  information,
  data
}

class UseMonitorPageState {
  static ValueNotifier<MonitorPageType> pageState = ValueNotifier(MonitorPageType.information);

  static void setPageState(MonitorPageType newState) {
    if(UseMonitorPageState.pageState.value == newState) return;

    UseMonitorPageState.pageState.value = newState;
  }
}