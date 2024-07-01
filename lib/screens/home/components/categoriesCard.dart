
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../login_reg/loginScreen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icon/api-interface-svgrepo-com.png",
        "text": "Electron",
      },
      {
        "icon": "assets/icon/desk-lamp-svgrepo-com.png",
        "text": "education",
      },
      {
        "icon": "assets/icon/insert-word-svgrepo-com.png",
        "text": "word",
      },
      {
        "icon": "assets/icon/location-svgrepo-com.png",
        "text": "medicine",
      },
      {
        "icon": "assets/icon/system-settings-svgrepo-com.png",
        "text": "Mechanical",
      },
      {
        "icon": "assets/icon/test-tube-svgrepo-com.png",
        "text": "Pharmacy",
      },
      {
        "icon": "assets/icon/icons8-more-64.png",
        "text": "more",
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        // Wrap with SingleChildScrollView for scrolling
        scrollDirection: Axis.horizontal,
        // Allow horizontal scrolling
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              categories.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: categoriesCard(
                  // Wrap with Expanded (optional)
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class categoriesCard extends StatelessWidget {
  categoriesCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B5999),
                  borderRadius: BorderRadius.circular(15),


                ),
                child: Image(
                  image: AssetImage(
                    icon,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}