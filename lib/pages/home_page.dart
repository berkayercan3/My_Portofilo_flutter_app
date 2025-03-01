import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/constants/size.dart';
import 'package:my_portofilo/widgets/drawer_mobile.dart';
import 'package:my_portofilo/widgets/header_desktop.dart';
import 'package:my_portofilo/widgets/header_mobile.dart';
import 'package:my_portofilo/widgets/main_desktop.dart';
import 'package:my_portofilo/widgets/main_mobile.dart';
import 'package:my_portofilo/widgets/project_card.dart';
import 'package:my_portofilo/widgets/projects_section.dart';
import 'package:my_portofilo/widgets/skills_desktop.dart';
import 'package:my_portofilo/widgets/skills_mobile.dart';
import 'package:my_portofilo/utils/project_utils.dart'; // Bu satırı ekleyin

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
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
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                color: CustomColor.bglight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      'What I Can Do',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Platforms
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //projects
              const ProjectsSection(),
              //contact
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
