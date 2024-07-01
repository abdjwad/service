import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service/search/search_feald.dart';
import 'package:service/screens/notifcation/notifacation.dart';

import '../../my_profile/profile_page.dart';
import '../../profail/account_screen.dart';
import 'icon_bot_home.dart';

class Home_headr extends StatelessWidget {
  const Home_headr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(onChanged: (String ) {  },),
          IconBall(image: 'assets/images/pasonal1.png', numnaf: 0, press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },),
          IconBall(image: 'assets/images/bell-.png', numnaf: 3, press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsPage()));
          },),

        ],
      ),
    );
  }
}
