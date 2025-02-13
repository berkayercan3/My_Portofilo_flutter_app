import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/constants/nav_items.dart';
import 'package:my_portofilo/styles/style.dart';
import 'package:my_portofilo/widgets/header_desktop.dart';
import 'package:my_portofilo/widgets/header_mobile.dart';
import 'package:my_portofilo/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.scaffoldBg,
        body: (ListView(
          children: [
            //main
            //const HeaderDesktop(),
            HeaderMobile(
              onMenuTap: () {},
              onLogoTap: () {},
            ),
            //skilss
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
            //projectsections
            Container(
              height: 500,
              width: double.maxFinite,
            ),
            //conact
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
            //footer
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
          ],
        )));
  }
}
