import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/constants/size.dart';
import 'package:my_portofilo/widgets/drawer_mobile.dart';
import 'package:my_portofilo/widgets/header_desktop.dart';
import 'package:my_portofilo/widgets/header_mobile.dart';
import 'package:my_portofilo/widgets/main_desktop.dart';
import 'package:my_portofilo/widgets/main_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : const DrawerMobile(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            children: [
              //main
              if (constraints.maxWidth >= kMinDesktopWidth)
                const HeaderDesktop()
              else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},
                ),
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),
              //skilss
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
                child: const Column(
                  //tittle
                  children: [
                    Text(
                      'What I Can Do',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                  ],
                ),

                //platforms and skills
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
          ),
        );
      },
    );
  }
}
