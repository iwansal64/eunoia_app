import 'package:eunoia_app/components/home/device/device.dart';
import 'package:eunoia_app/components/home/globals/home_navbar.dart';
import 'package:eunoia_app/components/home/about/about.dart';
import 'package:eunoia_app/hooks/use_home_page_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: ValueListenableBuilder(
              valueListenable: UseHomePageState.pageState,
              builder: (BuildContext ctx, var value, _) {
                switch (value) {
                  case HomePageType.device:
                    return DevicePage();
                  case HomePageType.information:
                    return AboutPage();
                }
              },
            ),
          ),
        ),
        HomeNavbar(),
      ],
    );
  }
}
