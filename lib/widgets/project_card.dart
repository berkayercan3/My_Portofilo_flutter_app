import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bglight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //projects image
          Image.asset(
            project.image,
            height: 160,
            width: 250,
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                  fontSize: 10, color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bglight1,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Row(
              children: [
                const Text(
                  "Avaliable on:",
                  style: TextStyle(
                      color: CustomColor.yellowSecondary, fontSize: 15),
                ),
                const Spacer(),
                if (project.webLink != null)
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.webLink]);
                      },
                      child: Image.asset(
                        'assets/web_button_icon.png',
                        width: 25,
                      ),
                    ),
                  ),
                const SizedBox(width: 5),
                if (project.gitLink != null)
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.gitLink]);
                      },
                      child: Image.asset(
                        'assets/github_button_icon.png',
                        width: 25,
                      ),
                    ),
                  ),
                const SizedBox(width: 5),
                if (project.webLink != null)
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.webLink]);
                      },
                      child: Image.asset(
                        'assets/youtube_button_icon.png',
                        width: 25,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
