import 'package:flutter/material.dart';

class RoundedIcons extends StatelessWidget {
  final String iconName;
  final Icon icon;
  final Gradient iconColor;
  const RoundedIcons(
      {super.key,
      required this.iconName,
      required this.iconColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: iconColor,
          ),
          child: IconButton(
            icon: icon,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(iconName),
      ],
    );
  }
}
