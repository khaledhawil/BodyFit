import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/pages/first_page.dart';
import 'package:graduation_project/pages/register.dart';
import 'package:graduation_project/pages/sgin_in.dart';
import 'Exercs/GridDemo.dart';
import 'Meals/screens_nutrition/home.dart';
import 'Screens/home.dart';
import 'Screens/settings.dart';
import 'firebase_options.dart';

String language = 'EN' ;

bool darkMode = false ;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //darkMode = instance.getBool('darkMode');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "sign_in" : (context)=> SignIn(),
        "register" : (context) => Register(),
        "first" : (context) => FirstPage(),
       // 'home' : (context) => Home(),
        "exercises" : (context) => GridDemo(),
        "home_page" : (context) => MyHomePage(),
        'meals' : (context) => nutrition_page(),
        'Settings' : (context) => Settings(),
        Register.id : (context) => Register(),
        FirstPage.id : (context) => FirstPage(),
      },
      // locale: Get.deviceLocale,
      // translations: MyLocale(),
      home: FirstPage(),

    );
  }
}
