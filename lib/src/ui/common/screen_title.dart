import 'package:flutter/material.dart';
import 'package:golden_shoes/src/utils/color.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: blackColor,
          fontSize: 26,
        ),
      ),
    );
  }
}
