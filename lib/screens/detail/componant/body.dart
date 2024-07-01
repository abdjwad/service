import 'package:flutter/material.dart';

import '../../../config/palette.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width:double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: size.width*0.8,
                child: Stack(
                  children: [
                    Container(
                      height: size.width*0.7,
                      width: size.width*0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,

                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
