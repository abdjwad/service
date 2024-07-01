import 'package:flutter/material.dart';

import '../config/palette.dart';

class DefulteButton extends StatelessWidget {
  const DefulteButton({
    super.key,
    required this.text,
    required this.prass,
  });

  final String text;
  final VoidCallback  prass;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Palette.activeColor),
        ),
        onPressed: prass,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryLightColor,
          ),
        ),
      ),
    );
  }
}