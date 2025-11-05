import 'package:flutter/material.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';

class Navbar extends StatelessWidget {
  const Navbar({ super.key });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: UsePageState.pageState, 
      builder: (BuildContext context, _) {
        return Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      UsePageState.setPageState(PageType.device);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: (UsePageState.pageState.value == PageType.device) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bluetooth, color: Colors.white,),
                          const Text(
                            "Devices",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
                GestureDetector(
                  onTap: () {
                    UsePageState.setPageState(PageType.information);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (UsePageState.pageState.value == PageType.information) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info, color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ),
                GestureDetector(
                  onTap: () {
                    UsePageState.setPageState(PageType.settings);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (UsePageState.pageState.value == PageType.settings) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}