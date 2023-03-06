import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Log out'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Log out'),
          onPressed: () {
            // Clear user authentication data
            clearUserData();

            // Navigate to login screen
            Navigator.pushReplacementNamed(context, "sign_in");
          },
        ),
      ),
    );
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
