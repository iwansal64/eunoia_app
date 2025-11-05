import 'package:flutter/foundation.dart';

class UseToastState {
  static ValueNotifier<String> toastTitle = ValueNotifier("");
  static ValueNotifier<String> lastToastTitle = ValueNotifier("");
  static ValueNotifier<String> toastMessage = ValueNotifier("");
  static ValueNotifier<bool> isToastShowed = ValueNotifier(false);

  static void showToast(String title, String message, {Duration? duration = const Duration(seconds: 2)}) {
    UseToastState.isToastShowed.value = true;
    UseToastState.toastTitle.value = title;
    UseToastState.lastToastTitle.value = title;
    UseToastState.toastMessage.value = message;

    // If duration is specified,
    if(duration != null ) {
      
      // Wait several seconds
      Future.delayed(duration).then((_) {
        if(UseToastState.lastToastTitle.value == title) {
          UseToastState.isToastShowed.value = false;
        }
      });
    }
  }
}