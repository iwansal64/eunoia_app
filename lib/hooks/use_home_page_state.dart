import 'package:flutter/foundation.dart';

enum HomePageType {
  device,
  information,
}

class UseHomePageState {
  static ValueNotifier<HomePageType> pageState = ValueNotifier(HomePageType.device);

  static void setPageState(HomePageType newPageType) {
    if(pageState.value == newPageType) return;
    UseHomePageState.pageState.value = newPageType;
  }
}