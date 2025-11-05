import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';

class UseToastState {
  static ValueNotifier<String> toastTitle = ValueNotifier("");
  static ValueNotifier<String> toastMessage = ValueNotifier("");
  static ValueNotifier<bool> isToastShowed = ValueNotifier(false);

  static void showToast(String title, String message, {Duration? duration = const Duration(seconds: 2)}) async {
    final Logger logger = Logger();
    logger.i("Show Toast");
    
    UseToastState.isToastShowed.value = true;
    UseToastState.toastTitle.value = title;
    UseToastState.toastMessage.value = message;

    // If duration is specified,
    if(duration != null) {
      
      // Wait several seconds
      Future.delayed(duration).then((_) {
        UseToastState.isToastShowed.value = false;
      });
    }
  }
}