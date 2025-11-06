import 'package:eunoia_app/components/monitor/data/data_title.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({ super.key });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          DataTitle()
        ],
      ),
    );
  }
}