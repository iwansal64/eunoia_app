import 'package:eunoia_app/components/monitor/data/data_title.dart';
import 'package:eunoia_app/hooks/use_data_state.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({ super.key });

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: UseBPMDataState.bpmDataState,
      builder: (BuildContext context, _) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              DataTitle(),
              Text("Data: ${UseBPMDataState.bpmDataState.value.lastOrNull ?? "-"}")
            ],
          ),
        );
      }
    );
  }
}