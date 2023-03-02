import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    // getProStatus();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    fadeInFadeOut = Tween<double>(begin: 0.1, end: 0.9).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
        animation.forward();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage())));
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  DateTime lastScan = DateTime(currentDate.day);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Expanded(child: SizedBox()),
                FadeTransition(
                  opacity: fadeInFadeOut,
                  child: Image.asset('assets/images/splash-icon.png',
                      height: 125, width: 125, color: Colors.blue,),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("BodyWise",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text(AppLocalizations.of(context)!.productBy,
                    //     style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w400)),
                    // Image.asset('assets/icons/eclixtech_logo.webp', height: 30),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}