import 'package:flutter/material.dart';
import 'package:service/config/palette.dart';

import '../../../utils/constant.dart';
import '../../favorat/favorat.dart';
import '../homeScreen.dart';
import '../../../jop/JobListPage.dart';
import 'bottombar_item.dart';


class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int _activeTabIndex = 0;
  final List _barItems = [
    {
      "icon": "assets/icon/home.svg",
      "page": HomeScreen(),
    },
    {
      "icon": "assets/icon/favorite-border.svg",
      "page": FavoritesPage(favoriteJobs: [], removeFromFavorites: (Job ) {  },)
    },
    {
      "icon": "assets/icon/filter.svg",
      "page":JobListPage(jobList:[] ,),
    },

  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == _activeTabIndex) return;
    _controller.reset();
    setState(() {
      _activeTabIndex = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Palette.appBgColor,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTabIndex,
      children: List.generate(
        _barItems.length,
        (index) => _buildAnimatedPage(_barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {

    return Container(

      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Palette.shadowColor.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _barItems.length,
            (index) => BottomBarItem(
              _barItems[index]["icon"],
              isActive: _activeTabIndex == index,
              onTap: () => onPageChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}
