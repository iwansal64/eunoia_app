import 'package:eunoia_app/components/information/information_title.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Column(
          children: [
            InformationTitle(),
          ],
        ),
      ),
    );
  }
}