import 'package:eunoia_app/components/home/about/about_content.dart';
import 'package:eunoia_app/components/home/about/about_title.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AboutTitle(),
            SizedBox(height: 50,),
            AboutContent(),
          ],
        ),
      ),
    );
  }
}