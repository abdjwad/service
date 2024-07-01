import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final bool value;
  final Function(bool value) onTap;

  const SettingSwitch({
    super.key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the app is in dark mode or light mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Set colors based on the theme mode
    Color backgroundColor = isDarkMode ? Colors.grey[800]! : bgColor;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color subtitleColor = isDarkMode ? Colors.grey[300]! : Colors.grey;

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const Spacer(),
          Text(
            value ? "On" : "Off",
            style: TextStyle(
              fontSize: 16,
              color: subtitleColor,
            ),
          ),
          const SizedBox(width: 20),
          CupertinoSwitch(
            value: value,
            onChanged: onTap,
            activeColor: isDarkMode ? Colors.green[300] : Colors.green,
          ),
        ],
      ),
    );
  }
}
