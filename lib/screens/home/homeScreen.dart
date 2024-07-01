import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:service/jop/JobListPage.dart' as job_list_page;
import '../favorat/favorat.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName="/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: GNav(
      //       rippleColor: Colors.grey,
      //       hoverColor: Colors.grey,
      //       haptic: true,
      //       tabBorderRadius: 20,
      //       tabActiveBorder: Border.all(color: Colors.black, width: 1),
      //       tabBorder: Border.all(color: Colors.blue, width: 1),
      //       tabShadow: [
      //         BoxShadow(
      //             color: Color(0xFF020F86).withOpacity(0.3), blurRadius: 15)
      //       ],
      //       curve: Curves.easeOutExpo,
      //       duration: Duration(milliseconds: 600),
      //       gap: 8,
      //       activeColor: Color(0xFF020F86),
      //       iconSize: 20,
      //
      //       // selected tab background color
      //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //       // navigation bar padding
      //       tabs: [
      //         GButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => FavoritesPage(favoriteJobs: [], removeFromFavorites: (Job ) {  },)),
      //             );
      //           },
      //           icon: Icons.favorite,
      //           text: 'Likes',
      //         ),
      //         GButton(
      //           icon: Icons.home,
      //           text: 'Home',
      //         ),
      //         GButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => job_list_page.JobListPage(jobList: [],)),
      //             );
      //           },
      //           icon: Icons.all_inbox,
      //           text: 'All',
      //         )
      //       ]),
      // ),

      body: Body(),
    );
  }
}
