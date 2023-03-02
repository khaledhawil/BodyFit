import 'package:flutter/material.dart';

// import '../Utilies/constants.dart';
import '../connectionCalculators.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // drawer: AppDrawer(),
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "All Calculators",
            style: TextStyle(color: Color(0xff8624dd)),
          ),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            GestureDetector(
              onTap: () {
                selectIndex = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 0,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff98DB63),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Bmi Calculator.png",
                        width: 80,
                        height: 80,
                        color: Color(0xff98DB63),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "BMI Calculator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff98DB63),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectIndex = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 2,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff5086CB),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/BMR Calculator.png",
                        width: 80,
                        height: 80,
                        color: Color(0xff5086CB),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "BMR Calculator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5086CB),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectIndex = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 1,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xffC1643B),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/BFP Calculator.png",
                        width: 80,
                        height: 80,
                        color: Color(0xffC1643B),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "BFP Calculator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffC1643B),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectIndex = 4;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 4,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xffD82D62),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/TDEE Calculator.png",
                        width: 80,
                        height: 80,
                        color: Color(0xffD82D62),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "TDEE Calculator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD82D62),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectIndex = 3;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 3,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xffC9312F),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/EER Calculator.png",
                        width: 80,
                        height: 80,
                        color: Color(0xffC9312F),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "EER Calculator",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffC9312F),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectIndex = 5;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllCalculator(
                        index: 5,
                      )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff6cc0e5),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                          child: Image.asset(
                            "assets/images/water1.png",
                            width: 80,
                            height: 80,
                            // color: Color(0xff27AE85),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "WID Calculator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6cc0e5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}