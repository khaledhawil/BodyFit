import 'package:flutter/material.dart';
import '../Screens/drawer.dart';
import '../constants.dart';

class Home extends StatefulWidget {
   final String username;
   const Home({Key? key,required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //bool _darkMode = false;
  @override
  Widget build(BuildContext context) {
   // String? userName;
    ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: kPrimaryColor,
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
          elevation: .15,
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
                Container(
                  alignment: Alignment.centerLeft,
                  height: 160,
                  width: 400,
                  margin: EdgeInsets.only(top: 20.0, left: 10, right: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff0000),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff8624dd), width: 2)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "home_page");
                      // Navigate to "The exercise" screen
                    },
                    child: Row(
                      children: [
                        Text('Calculate your \nbody needed!',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Color(0xff8624dd),
                                fontWeight: FontWeight.w600)),
                        Expanded(
                          child: Container(
                            width: 140,
                            height: 150,
                            child: Image.asset('assets/images/body4.jpg'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
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
                      border: Border.all(color: Color(0xff53d1c9), width: 2)),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigate to "The exercise" screen
                      Navigator.pushNamed(context, "exercises");
                    },
                    child: Row(
                      children: [
                        Text('Go to your \nexercises',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Color(0xff53d1c9),
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: Container(
                          width: 140,
                          height: 150,
                          child: Image.asset('assets/images/exs.jpg'),
                        ))
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
