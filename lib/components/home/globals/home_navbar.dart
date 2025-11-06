import 'package:flutter/material.dart';
import 'package:eunoia_app/hooks/use_home_page_state.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({ super.key });

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        child: SizedBox(
          height: 60,
          child: ListenableBuilder(
            listenable: UseHomePageState.pageState, 
            builder: (BuildContext context, _) {
              return Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        UseHomePageState.setPageState(HomePageType.device);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: (UseHomePageState.pageState.value == HomePageType.device) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bluetooth, color: Colors.white),
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        UseHomePageState.setPageState(HomePageType.information);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: (UseHomePageState.pageState.value == HomePageType.information) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lightbulb, color: Colors.white),
                            const Text(
                              "About",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              );
            },
        ),
      ),
    );
  }
}