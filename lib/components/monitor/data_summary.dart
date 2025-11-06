import 'package:eunoia_app/hooks/use_data_state.dart';
import 'package:flutter/material.dart';

class DataSummary extends StatelessWidget {
  const DataSummary({ super.key });
  
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        border: BoxBorder.all(width: 2, color: Color.fromARGB(255, 93, 73, 54)),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Status(),
              DataAverageBPM(),
            ],
          )
        ),
      ),
    );
  }
}

class DataAverageBPM extends StatelessWidget {
  const DataAverageBPM({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: UseBPMDataState.bpmDataState,
      builder: (BuildContext context, _) {
        return Text("${UseBPMDataState.bpmDataState.value.lastOrNull ?? "-"} BPM");
      }
    );
  }
}

class Status extends StatelessWidget {
  const Status({ super.key });

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: UseBPMDataState.bpmDataState,
      builder: (BuildContext context, _) {
        int? bpm = UseBPMDataState.bpmDataState.value.lastOrNull;
        if(bpm == null) {
          return const Text("-");
        }
        else if(bpm >= 120) {
          return const Text("Stressed", style: TextStyle(color: Color.fromARGB(255, 28, 53, 112)),);
        }
        else if(bpm < 120 && bpm >= 60) {
          return const Text("Stable", style: TextStyle(color: Color.fromARGB(255, 111, 145, 40)),);
        }
        else {
          return const Text("Relaxed", style: TextStyle(color: Color.fromARGB(255, 28, 53, 112)),);
        }
      }
    );
  }
}