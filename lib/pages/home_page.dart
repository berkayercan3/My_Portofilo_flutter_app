import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/constants/size.dart';
import 'package:my_portofilo/widgets/contact_section.dart';
import 'package:my_portofilo/widgets/drawer_mobile.dart';
import 'package:my_portofilo/widgets/footer.dart';
import 'package:my_portofilo/widgets/header_desktop.dart';
import 'package:my_portofilo/widgets/header_mobile.dart';
import 'package:my_portofilo/widgets/main_desktop.dart';
import 'package:my_portofilo/widgets/main_mobile.dart';
import 'package:my_portofilo/widgets/projects_section.dart';
import 'package:my_portofilo/widgets/skills_desktop.dart';
import 'package:my_portofilo/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(
    4,
    (index) => GlobalKey(),
  );

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
              : DrawerMobile(onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                }),
          backgroundColor: CustomColor.scaffoldBg,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),

                //main
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
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
                  key: navbarKeys[1],
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
                ProjectsSection(key: navbarKeys[2]),
                const SizedBox(height: 30),

                //contact
                ContactSection(key: navbarKeys[3]),
                const SizedBox(height: 30),

                //footer
                const Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page
      // when you create a blog site or page add a can navigate
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
