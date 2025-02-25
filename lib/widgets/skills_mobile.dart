import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';
import 'package:my_portofilo/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          for (int b = 0; b < platformItems.length; b++)
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bglight2,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                leading: Image.asset(
                  platformItems[b]["img"],
                  width: 26.0,
                ),
                title: Text(platformItems[b]["title"]),
              ),
            ),
          const SizedBox(height: 50),
          // Skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int a = 0; a < skillItems.length; a++)
                Chip(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  backgroundColor: CustomColor.bglight2,
                  label: Text(skillItems[a]["title"]),
                  avatar: Image.asset(skillItems[a]["img"]),
                ),
            ],
          )
        ],
      ),
    );
  }
}
