import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:service/config/palette.dart';
import 'package:service/screens/home/homeScreen.dart';
import 'package:service/widget/widget.dart';

import '../screens/home/components/root_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pexels-goumbik-652355.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3B5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcom to",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? "Service" : "Back",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? 'SignUp to Counter'
                          : "SignUp to Counter",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildbuttom(true),
          AnimatedPositioned(
            duration: Duration(microseconds: 700),
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(microseconds: 700),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(20),
              height: isSignupScreen ? 380 : 250,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5)
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.deepOrange,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SINGUP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.deepOrange,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignUp(),
                    if (!isSignupScreen) buildsignin(),
                  ],
                ),
              ),
            ),
          ),
          buildbuttom(false),
        ],
      ),
    );
  }

  Container buildsignin() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(
              MaterialCommunityIcons.email_outline, "email", false, true),
          buildTextField(
              MaterialCommunityIcons.lock_outline, "Password", true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: Palette.textColor2,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  Text(
                    'Remember My',
                    style: TextStyle(fontSize: 10, color: Palette.textColor1),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildbuttom(bool showShadow) {
    return AnimatedPositioned(
        duration: Duration(microseconds: 700),
        top: isSignupScreen ? 535 : 445,
        right: 0,
        left: 0,
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kPrimaryColor, Palette.facebookColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        if (showShadow)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1.5,
                            blurRadius: 10,
                          )
                      ],
                    ),
                    child: InkWell(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => RootApp(),));
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Center(),
          ),
        ));
  }

  Container buildSignUp() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(MaterialCommunityIcons.account_outline, "User Name",
              false, false),
          buildTextField(
              MaterialCommunityIcons.email_outline, "email", false, true),   buildTextField(
              MaterialCommunityIcons.lock_outline, "Password", false, true),
          buildTextField(
              MaterialCommunityIcons.lock_outline, "Pre-Password", true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Palette.textColor2 : Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      Text(
                        'Male',
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : Palette.textColor2,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Palette.textColor1
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      Text(
                        'Female',
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   width: 200,
          //   margin: EdgeInsets.only(top: 20),
          //   child: RichText(
          //     textAlign: TextAlign.center,
          //     text: TextSpan(
          //         text: "By pressing 'Submit' you agree to our ",
          //         style: TextStyle(color: Palette.textColor2),
          //         children: [
          //           TextSpan(
          //             //recognizer: ,
          //             text: "term & conditions",
          //             style: TextStyle(color: Colors.orange),
          //           ),
          //         ]),
          //   ),
          // ),
        ],
      ),
    );
  }
}
