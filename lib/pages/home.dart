import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/Exercs/GridDemo.dart';
import '../Screens/drawer.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    // Set up a timer that refreshes the page every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    ModalRoute.of(context)!.settings.arguments as String?;
    //MyLocaleController controllerLang = Get.find();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            icon: Image.asset(
              'assets/images/ic_drawer.webp',
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: .19,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  margin: EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  decoration: BoxDecoration(
                      color: Color(0xfff76e37),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hello,',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffeff3f4)),
                              ),
                              Text(
                                '${widget.username}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff005c91)),
                              ),
                            ],
                          ),
                          Text(
                            'How are you today?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffeff3f4)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${DateFormat('EEE, MMM d, h:mm a').format(DateTime.now())}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 120,
                        height: 140,
                        child: Image(
                            image: AssetImage('assets/images/fitness.png')),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 160,
                  width: 400,
                  margin: EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigate to "The Nutrition" screen
                      Navigator.pushNamed(context, 'meals');
                    },
                    child: Row(
                      children: [
                        Text('Nutrition\nand Meals',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: Container(
                          width: 140,
                          height: 150,
                          child: Image.asset('assets/food2.png'),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 160,
                  width: 400,
                  margin: EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffAa1444), width: 2)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "calculator");
                      // Navigate to "The exercise" screen
                    },
                    child: Row(
                      children: [
                        Text('Calculate your \nbody needed!',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Color(0xffAa1444),
                                fontWeight: FontWeight.w600)),
                        Expanded(
                          child: Container(
                            width: 140,
                            height: 150,
                            child: Image.asset('assets/body.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 160,
                  width: 400,
                  margin: EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigate to "The exercise" screen
                      Navigator.pushNamed(context, "exercises");
                      Get.to(() => GridDemo());
                    },
                    child: Row(
                      children: [
                        Text('Go to your \nexercises',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue[500],
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: Container(
                          width: 140,
                          height: 150,
                          child: Image.asset('assets/exerss.png'),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
              ]),
        ));
  }
}
