import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  static final String customAppThemeId = 'custom_theme';

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
      print("package info $_packageInfo");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color(0xfff76e37),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      elevation: 0,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xff111212)),
                  //this is a drawer name here
                  color: Colors.white54),
              child: Row(
                children: [
                  //this is a photo
                  Image.asset(
                    'assets/images/wise.png',
                    width: 50,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BodyWise",
                          style: TextStyle(
                            fontFamily: 'Bolt',
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
             InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Settings');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // if (Platform.isIOS) {
                //
                // }
                // // // Android
                // if (Platform.isAndroid) {
                //   launch(
                //
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_rate_us.webp',
                        height: 20,
                        color: Theme.of(context).colorScheme.inverseSurface),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Rate Us",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'Khaledhawil91@gmail.com',
                  query:
                  'subject=Health Calculator &  BodyWise Feedback', //add subject and body here
                );
                launchUrl(params);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_feedback.webp',
                        height: 20,
                        color: Theme.of(context).colorScheme.inverseSurface),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Feedback",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                try {
                  Navigator.pop(context);
                  // iOS
                  // if (Platform.isIOS) {
                  //   Share.share(
                  //       '${AppLocalizations.of(context)!.heyDownload}!= https://apps.apple.com/us/app/1608350899');
                  // }
                  // // // Android
                  // if (Platform.isAndroid) {
                  //   Share.share(
                  //       '${AppLocalizations.of(context)!.heyDownload} != https://play.google.com/store/apps/details?id=com.pdf.photos.converter.image.pic');
                  // }
                } catch (e) {
                  print("error $e");
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Share Us",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                launch(
                    "https://github.com/khaledhawil");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_privacy_policy.webp',
                      height: 20,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "About Me",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                launch(
                    "https://github.com/khaledhawil/Graduation-Project/blob/master/README.md");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Icon(
                      Icons.design_services,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                launch(
                    "https://github.com/khaledhawil");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  //    color: Color(0xffF2F2F2),
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    // Image.asset('assets/images/ic_privacy_policy.webp',height: 20, color: Theme.of(context).colorScheme.inverseSurface,),
                    Icon(
                      Icons.more_vert_outlined,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "More Apps",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}