import 'package:eunoia_app/components/monitor/information/information_contents.dart';
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
          InformationTitle(),
          SizedBox(height: 50,),
          Expanded(
            child: InformationContents()
          )
        ],
      ),
    );
  }
}