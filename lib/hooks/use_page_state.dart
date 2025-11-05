import 'package:flutter/foundation.dart';

enum PageType {
  device,
  information,
  settings
}

class UsePageState {
  static ValueNotifier<PageType> pageState = ValueNotifier(PageType.device);

  static void setPageState(PageType newPageType) {
    if(pageState.value == newPageType) return;
    UsePageState.pageState.value = newPageType;
  }
}