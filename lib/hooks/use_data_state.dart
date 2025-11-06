import 'package:flutter/cupertino.dart';

class UseBPMDataState {
  static ValueNotifier<List<int>> bpmDataState = ValueNotifier([]);
  

  static void addBPMData(int bpm) {
    bpmDataState.value = [...bpmDataState.value, bpm];
  }

  static void resetBPMData() {
    bpmDataState.value = [];
  }
}