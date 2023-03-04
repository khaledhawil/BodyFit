import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/main.dart';

class ProviderDate extends ChangeNotifier{

  ThemeData _themeData = darkMode? ThemeData.dark() : ThemeData.light();

  getTheme(){
    return _themeData;

  }

  setTheme(ThemeData theme) {
    _themeData  = theme ;
    notifyListeners();

  }



}