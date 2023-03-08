// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
// import 'package:get/get.dart';
// import 'home.dart';

// This Page is the first page whene user open the app
// ---------------------------------------------------
// Whene User enters the app , it appears to him the first page, To choose the login method
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  static String id = 'first_page';

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState(){
    Firebase.initializeApp();
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      if (_auth.currentUser !=null ) {
        Get.to(() => Home(username: '',));
      } else
      {
        Get.to(() => FirstPage());
      }
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    // Here are Page contents
    // -1 body the photo
    // -2 the app's name
    // -3 methods to login
    return Scaffold(
      //backgroundColor: //kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(40),
              ),
              Container(
                child: Center(
                  child: Image(image: AssetImage('assets/images/fit.jpg')),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'My Fitnees',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Choose your way to enter!', style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 75,
              ),
              // this container to sign up
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // this container to sign in
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "sign_in");
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Home(username: ''),
                    ),
                  );
                },
                child: Text('Skip',style: TextStyle(color: Colors.red),),

              )
            ],
          ),
        ),
      ),
    );
    // this end of the page
  }
}
