import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/pages/first_page.dart';
import 'package:graduation_project/pages/home.dart';
import 'package:graduation_project/pages/login_screen.dart';
import 'package:graduation_project/pages/register.dart';
import 'package:graduation_project/pages/sgin_in.dart';
import 'Exercs/GridDemo.dart';
import 'Screens/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "sign_in" : (context)=> SignIn(),
        "register" : (context) => Register(),
        "first" : (context) => FirstPage(),
       // 'home' : (context) => Home(),
        "exercises" : (context) => GridDemo(),
        "home_page" : (context) => MyHomePage(),
        Register.id : (context) => Register(),
        FirstPage.id : (context) => FirstPage(),

      },
      home: FirstPage(),

    );
  }
}
