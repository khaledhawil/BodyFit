
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/main.dart';

class Language extends ChangeNotifier{

  String _lang = language ;

  getLanguage(){
    return _lang ;
  }

  setLanguage(String lang) {
    _lang = lang ;
    notifyListeners();
  }
}