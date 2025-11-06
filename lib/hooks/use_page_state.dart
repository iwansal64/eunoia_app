import 'package:flutter/foundation.dart';

enum PageType {
  home,
  monitor
}

class UsePageState {
  static ValueNotifier<PageType> pageState = ValueNotifier(PageType.monitor);

  static void setPageState(PageType newPageType) {
    if(pageState.value == newPageType) return;
    UsePageState.pageState.value = newPageType;
  }
}