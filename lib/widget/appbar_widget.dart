import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(
          Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
      ),
    ],
  );
}
