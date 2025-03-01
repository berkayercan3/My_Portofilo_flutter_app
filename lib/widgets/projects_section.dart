import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/utils/project_utils.dart';
import 'package:my_portofilo/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //Work Projects Tittle
          const Text(
            'Work Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          //Work Projects Card
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 1; i < workProjects.length; i++)
                  ProjectCardWidget(project: workProjects[i]),
                ProjectCardWidget(project: workProjects.first),
              ],
            ),
          ),
          const SizedBox(height: 80),
          //Hobby Projects Tittle
          const Text(
            'Hobby Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          //Hobby Projects Card
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 1; i < hobbyProjects.length; i++)
                  ProjectCardWidget(project: hobbyProjects[i]),
                ProjectCardWidget(project: hobbyProjects.first),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
