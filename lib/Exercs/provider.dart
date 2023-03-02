import 'package:flutter/material.dart';

import 'Model/Model.dart';


class GymProvider with ChangeNotifier {
  List<ExerciesModel> gymList = [];
  late ExerciesModel exerciesModel;

  // getGym() async {
  //   gymList = await CustomHttpRequest().getAllGym();
  //   notifyListeners();
  // }
}
