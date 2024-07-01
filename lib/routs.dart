import 'package:flutter/widgets.dart';
import 'package:service/screens/home/homeScreen.dart';
import 'package:service/screens/my_profile/my_profile.dart';
import 'package:service/screens/splash/splash_screen.dart';
final Map <String,WidgetBuilder>routes={

  SplashScreen.routeName:(context)=>SplashScreen(),
  HomeScreen.routeName:(context)=>HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
};