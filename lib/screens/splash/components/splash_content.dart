import 'package:flutter/material.dart';
import 'package:service/config/palette.dart';
import 'package:service/login_reg/loginScreen.dart';

import '../../../components/defulte_Button.dart';

class SplashContent extends StatefulWidget {
  SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcom to Service , Lit`s Find Jop !",
      "image": "assets/images/sp1.png",
    },
    {
      "text": "Explore a Wide Range of Opportunities",
      "image": "assets/images/sp2.png",
    },
    {
      "text": "Connect with Top Employers",
      "image": "assets/images/sp3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => splashConte(
                image: splashData[index]["image"]?.trim() ?? "Default Text",
                text: splashData[index]["text"]?.trim() ?? "Default Text",
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefulteButton(
                    prass: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    text: 'Continue',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class splashConte extends StatelessWidget {
  splashConte({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'SERVICE',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Palette.activeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Spacer(
          flex: 2,
        ),
        Image(
          image: AssetImage(
            image,
          ),
          height: 260,
          width: 260,
        ),
      ],
    );
  }
}
