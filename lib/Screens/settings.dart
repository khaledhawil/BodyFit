import 'package:flutter/material.dart';
import 'package:graduation_project/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _darkMode = false;

  String _selectedLanguage = 'ar';

  @override
  void initState() {
    super.initState();
    setState(() => _darkMode = darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: .15,
          title: Text(
            "Settings",
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Language'),
                Spacer(),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items: <String>['ar', 'en']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              children: [
                Text('Dark mode'),
                Spacer(),
                Switch(
                  value: false, // TODO: Replace with your actual value
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                      // TODO: Handle switch state change
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
