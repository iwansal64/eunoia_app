import 'package:flutter/material.dart';
import 'package:eunoia_app/hooks/use_toast_state.dart';

class Toast extends StatelessWidget {
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: UseToastState.isToastShowed,
      builder: (BuildContext context, _) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: UseToastState.isToastShowed.value ? 15 : -30,
          right: 15,
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: UseToastState.isToastShowed.value ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: SizedBox(
              width: 250,
              height: 100,
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 242, 229),
                  border: BoxBorder.all(
                    width: 2,
                    color: Color.fromARGB(255, 93, 73, 54),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UseToastState.toastTitle.value,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        UseToastState.toastMessage.value,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
