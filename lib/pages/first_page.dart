//import 'package:first_day_flutter/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/pages/signup_page.dart';
import '../constants.dart';
import 'login_screen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
   static String id = 'first_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
              Text('Choose your way to enter!',
                  style: TextStyle(
                      fontSize: 20
                  )
              ),
              SizedBox(
                height: 75,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                    'register');
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                    "sign_in");
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
