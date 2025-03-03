import 'package:flutter/material.dart';
import 'package:my_portofilo/constants/color.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 300,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made By Berkay Ercan with Flutter 3.13",
        style: TextStyle(
            fontWeight: FontWeight.w400, color: CustomColor.whiteSecondary),
      ),
    );
  }
}
