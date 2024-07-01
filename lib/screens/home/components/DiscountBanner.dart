import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/palette.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
            color: Color(0xFF3B5999).withOpacity(0.9), borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black87,
          blurRadius: 8.0,
          spreadRadius: 2.0,
        ),
      ],
      ),
      child: Text.rich(TextSpan(
          text: 'FOR YOU \n',
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: 'Let`s Go',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ])),
    );
  }
}
