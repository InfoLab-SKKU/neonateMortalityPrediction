import 'package:flutter/material.dart';

import 'custom_title.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;
  final bool hasTitleInside;
  final bool hasPercentageSign;
  const ResultCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
    this.hasPercentageSign = true,
    this.hasTitleInside = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hasTitleInside)
          Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: CustomTitle(
              title: title,
            ),
          ),
        if (!hasTitleInside)
          const SizedBox(
            height: 10,
          ),
        Card(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            child: Column(
              children: [
                if (hasTitleInside)
                  CustomTitle(
                    title: title,
                  ),
                if (hasTitleInside)
                  const SizedBox(
                    height: 28.0,
                  ),
                Text(
                  hasPercentageSign ? '$value%' : '$value',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color, fontSize: 42.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
