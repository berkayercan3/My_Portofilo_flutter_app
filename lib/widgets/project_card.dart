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
      height: 260,
      width: 240,
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
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                  fontSize: 11, color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bglight1,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Row(
              children: [
                const Text(
                  "Avaliable on:",
                  style: TextStyle(
                      color: CustomColor.yellowSecondary, fontSize: 14),
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
                if (project.youtubeLink != null)
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [project.youtubeLink]);
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
