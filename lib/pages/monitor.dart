import 'package:eunoia_app/components/monitor/data/data.dart';
import 'package:eunoia_app/components/monitor/information/information.dart';
import 'package:eunoia_app/hooks/use_monitor_page_state.dart';
import 'package:flutter/material.dart';

class MonitorPage extends StatelessWidget {
  const MonitorPage({ super.key });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: ListenableBuilder(
          listenable: UseMonitorPageState.pageState,
          builder: (BuildContext context, _) {
            switch (UseMonitorPageState.pageState.value) {
              case MonitorPageType.information:
                return InformationPage();
              case MonitorPageType.data:
                return DataPage();
            }
          }
        ),
      ),
    );
  }
}