import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/models/user.dart';  // استيراد الكلاس User
import '../../utils/user_preferences.dart';  // استيراد UserPreferences
import '../../widget/appbar_widget.dart';
import '../../widget/button_widget.dart';
import '../../widget/numbers_widget.dart';
import '../../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final picker = ImagePicker();
  late User user;  // تعريف كائن User

  @override
  void initState() {
    super.initState();
    user = UserPreferences.myUser;  // استرجاع بيانات المستخدم من UserPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () => selectImage(context),  // استدعاء selectImage عند النقر على الصورة
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  // عرض اسم المستخدم والبريد الإلكتروني
  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  // عرض زر للترقية إلى النسخة المحترفة
  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  // عرض قسم "حول" للمستخدم
  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

  // اختيار صورة من معرض الصور وتحديث الصورة
  Future<void> selectImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        user.imagePath = pickedFile.path;  // تحديث مسار الصورة في كائن User
        UserPreferences.saveUser(user);  // حفظ بيانات المستخدم بمسار الصورة المحدث
      });
    }
  }
}
