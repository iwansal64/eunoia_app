import 'package:eunoia_app/hooks/use_monitor_page_state.dart';
import 'package:eunoia_app/hooks/use_page_state.dart';
import 'package:flutter/material.dart';

class MonitorNavbar extends StatelessWidget {
  const MonitorNavbar({ super.key });

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.center,
        child: SizedBox(
          height: 60,
          child: ListenableBuilder(
            listenable: UseMonitorPageState.pageState, 
            builder: (BuildContext context, _) {
              return Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        UseMonitorPageState.setPageState(MonitorPageType.data);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: (UseMonitorPageState.pageState.value == MonitorPageType.data) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bar_chart, color: Colors.white),
                            const Text(
                              "Data",
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
                        UseMonitorPageState.setPageState(MonitorPageType.information);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: (UseMonitorPageState.pageState.value == MonitorPageType.information) ? Color.fromARGB(255, 162, 194, 119) : Color.fromARGB(255, 112, 148, 112)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info, color: Colors.white),
                            const Text(
                              "Information",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      UsePageState.setPageState(PageType.home);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 112, 148, 112)
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home, color: Colors.white,)
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