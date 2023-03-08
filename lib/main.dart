import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/BMI/bmiCalculator.dart';
import 'package:graduation_project/pages/first_page.dart';
import 'package:graduation_project/pages/log_out.dart';
import 'package:graduation_project/pages/register.dart';
import 'package:graduation_project/pages/sgin_in.dart';
import 'Exercs/GridDemo.dart';
import 'Meals/screens_nutrition/home.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "sign_in" : (context)=> SignIn(),
        'Log_out' : (context) => LogoutPage(),
        "register" : (context) => Register(),
        "first" : (context) => FirstPage(),
       // 'home' : (context) => Home(),
        "exercises" : (context) => GridDemo(),
        "calculator" : (context) => MyHomePage(),
        "BMICal" : (context) =>      BMICalculator(),
        'meals' : (context) => nutrition_page(),
        Register.id : (context) => Register(),
        FirstPage.id : (context) => FirstPage(),
      },
      home: FirstPage(),

    );
  }
}
