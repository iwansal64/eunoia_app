import 'package:eunoia_app/components/monitor/information/information_title.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({ super.key });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InformationTitle()
        ],
      ),
    );
  }
}