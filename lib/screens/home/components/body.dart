import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:service/screens/home/components/sectionTitle.dart';
import '../../../utils/data.dart';
import '../../favorat/componant/feature_item.dart';
import '../../favorat/favorat.dart';
import 'DiscountBanner.dart';
import 'categoriesCard.dart';
import 'home_hradr.dart';


class Body extends StatefulWidget {
  Body({super.key});

  int currentIndex = 0;

  List screen = [];

  final List _Post = [
    "Post1",
    "Post2",
    "Post3",
    "Post4",
    "Post5",
  ];

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Favorite')),
    const Center(child: Text('Home')),
    const Center(child: Text('all')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 210,
            decoration: const BoxDecoration(
                color: Color(0xFF3B5999),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Home_headr(),
                  const SizedBox(
                    height: 30,
                  ),
                  const DiscountBanner(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Categories(),
                  SectionTitle(
                    text: "Special for you",
                    press: () {},
                  ),
                  _buildFeatured(),                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
            (index) => FeatureItem(
          data: features[index],
          onTapFavorite: () {
            setState(() {
              features[index]["is_favorited"] =
              !features[index]["is_favorited"];
            });
          },
        ),
      ),
    );
  }
  // CurvedNavigationBar BottomNavigationBar() {
  //   return CurvedNavigationBar(
  //     color: Color(0X3865C4FF),
  //     backgroundColor: Colors.white.withOpacity(0.1),
  //     buttonBackgroundColor: Color(0xFF3865C4),
  //     items: <CurvedNavigationBarItem>[
  //       CurvedNavigationBarItem(
  //         child: InkWell(
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => job_list_page.JobListPage(),
  //                   ));
  //             },
  //             child: Icon(Icons.done_all_sharp, size: 30)),
  //         label: 'all',
  //       ),
  //       CurvedNavigationBarItem(
  //         child: Icon(Icons.home, size: 30),
  //         label: 'Home',
  //       ),
  //       CurvedNavigationBarItem(
  //         child: InkWell(
  //             onTap: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => FavoritesPage()));
  //             },
  //             child: Icon(Icons.favorite, size: 30)),
  //         label: 'favorite',
  //       ),
  //     ],
  //     onTap: (index) {
  //       setState(() {
  //         _pageIndex = index;
  //       });
  //     },
  //   );
  // }
}
