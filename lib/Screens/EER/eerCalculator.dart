import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/EER/resultScreen.dart';

import '../../Utilies/constants.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/customText.dart';
import '../../Widgets/customTextField.dart';
class EERCalculator extends StatefulWidget{
  @override
  State<EERCalculator> createState() => _EERCalculatorState();
}

class _EERCalculatorState extends State<EERCalculator> {
  int gender = 0;
  List<String> list = ['kg', 'lb'];
  String selectList = 'kg';
  List<String> listHeight = ['ft', 'cm'];
  String selectListHeight = 'cm';
  List<String> listActivity = ['Sedentery', 'Lightly Active', 'Moderately Active', 'Very Active'];
  String selectListActivity = 'Sedentery';
  List<String> listGoal = ['Maintain Weight', 'Loose Weight', 'Gain Weight'];
  String selectListGoal = 'Maintain Weight';
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var eer = 0.0;

  List<DropdownMenuItem> generateItems(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> generateItemsHeight(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> generateItemsActivity(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> generateItemsGoal(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: kHrPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: (){
                      setState(() {
                        gender = 0;
                      });
                    },
                    title: "Male",
                    textColor: gender == 0? Colors.white:Colors.black,
                    btnColor: gender == 0? Color(0xffC9312F):Colors.white,
                    btnBorderColor: gender == 0? Colors.transparent:Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: (){
                      setState(() {
                        gender = 1;
                      });
                    },
                    title: "Female",
                    textColor: gender == 1? Colors.white:Colors.black,
                    btnColor: gender == 1? Color(0xffC9312F):Colors.white,
                    btnBorderColor: gender == 1? Colors.transparent:Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Your Age",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomTextField(
                      controller: ageController,
                      hintText: "0",
                      hintTextColor: Colors.grey.shade500,
                      fieldborderColor: Colors.transparent,
                      keyboardType: TextInputType.number,
                      isOutlineInputBorderColor: Colors.transparent,
                      textFieldFillColor: Colors.transparent,
                    ),
                  ),
    
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CustomText(
                        title: "Years",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Height",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  (selectListHeight == "cm")? Expanded(
                    flex: 5,
                    child: CustomTextField(
                      controller: heightController,
                      hintText: "0",
                      hintTextColor: Colors.grey.shade500,
                      fieldborderColor: Colors.transparent,
                      keyboardType: TextInputType.number,
                      isOutlineInputBorderColor: Colors.transparent,
                      textFieldFillColor: Colors.transparent,
                    ),
                  ): Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.grey, width: 2))
                            ),
                            child: CustomTextField(
                              controller: feetController,
                              hintText: "feet",
                              hintTextColor: greyColor,
                              isOutlineInputBorderColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.grey, width: 2))
                            ),
                            child: CustomTextField(
                              controller: inchController,
                              hintText: "in",
                              hintTextColor: greyColor,
                              isOutlineInputBorderColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
    
                  Expanded(
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: selectListHeight,
                      items: generateItemsHeight(listHeight),
                      onChanged: (dynamic item) {
                        setState(() {
                          selectListHeight = item;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Weight",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: CustomTextField(
                      controller: weightController,
                      hintText: "0",
                      hintTextColor: Colors.grey.shade500,
                      fieldborderColor: Colors.transparent,
                      keyboardType: TextInputType.number,
                      isOutlineInputBorderColor: Colors.transparent,
                      textFieldFillColor: Colors.transparent,
                    ),
                  ),
    
                  Expanded(
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: selectList,
                      items: generateItems(list),
                      onChanged: (dynamic item) {
                        setState(() {
                          selectList = item;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Choose Activity Level",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: selectListActivity,
                  items: generateItemsActivity(listActivity),
                  onChanged: (dynamic item) {
                    setState(() {
                      selectListActivity = item;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Weight Goal",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: selectListGoal,
                  items: generateItemsActivity(listGoal),
                  onChanged: (dynamic item) {
                    setState(() {
                      selectListGoal = item;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    title: "Cancel",
                    textColor: Colors.black,
                    btnBorderColor: Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: (){
                      if(selectListHeight == "cm"){
                        if (ageController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            weightController.text.isNotEmpty) {
                          getEer(weightController.text, heightController.text,
                              ageController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EERResultPage(
                                eer: eer,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "All fields are required.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            backgroundColor: Color(0xff666666),
                            duration: Duration(milliseconds: 1000),
                          ));
                        }
                      }else{
                        if (ageController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            weightController.text.isNotEmpty) {
                          getEerft(
                              weightController.text,
                              feetController.text,
                              inchController.text,
                              ageController.text
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EERResultPage(
                              eer: eer,
                            ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "All fields are required.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            backgroundColor: Color(0xff666666),
                            duration: Duration(milliseconds: 1000),
                          ));
                        }
                      }
                    },
                    title: "Calculate",
                    textColor: Colors.white,
                    btnColor: Color(0xffC9312F),
                    btnRadius: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  convertLbsToKG(value) {
    return value / 2.205;
  }

  converCmToM(cm) {
    return cm / 100;
  }

  convertFt_InToM(ft, inch) {
    return ft / 3.281 + inch / 39.37;
  }

  getEer(weight_, height_1, age_) {
    var height_ = 0.0;
    double A_l = 0.0;

    try {
      age_ = double.parse(age_);
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
    //  height_2 = double.parse(height_2);

      if (selectList != "kg") {
        weight_ = convertLbsToKG(weight_);
      } else {
        weight_ = weight_;
      }
      if (selectListHeight == "cm") {
        height_ = converCmToM(height_1);
      }
      // else {
      //   height_ = convertFt_InToM(height_1, height_2);
      // }

      if (gender == 0) {
        if (selectListActivity == 'Sedentery') {
          A_l = 1.0;
        } else if (selectListActivity == 'Lightly Active') {
          A_l = 1.11;
        } else if (selectListActivity == 'Moderately Active') {
          A_l = 1.25;
        } else if (selectListActivity == 'Very Active') {
          A_l = 1.48;
        }

        if (age_ > 0 && age_ < 9) {
          eer = 88.5 -
              (61.9 * age_) +
              A_l * (26.7 * weight_ + 903 * height_) +
              20;
        } else if (age_ > 8 && age_ < 19) {
          eer = 88.5 -
              (61.9 * age_) +
              A_l * (26.7 * weight_ + 903 * height_) +
              25;
        } else if (age_ > 18) {
          eer = 662 -
              (9.53 * age_) +
              A_l * ((15.91 * weight_) + (539.6 * height_));
        }
        print("eer: ${eer}");
      } else {
        if (selectListActivity == 'Sedentery') {
          A_l = 1.0;
        } else if (selectListActivity == 'Lightly Active') {
          A_l = 1.12;
        } else if (selectListActivity == 'Moderately Active') {
          A_l = 1.27;
        } else if (selectListActivity == 'Very Active') {
          A_l = 1.45;
        }

        if (age_ > 0 && age_ < 9) {
          eer = 135.3 -
              (30.8 * age_) +
              A_l * ((10.0 * weight_) + (934 * height_)) +
              20;
        } else if (age_ > 8 && age_ < 19) {
          eer = 135.3 -
              (30.8 * age_) +
              A_l * ((10.0 * weight_) + (934 * height_)) +
              25;
        } else if (age_ > 18) {
          eer =
              354 - (6.91 * age_) + A_l * ((9.36 * weight_) + (726 * height_));
        }
      }

      return num.parse(eer.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getEerft(weight_, height_1, height_2, age_) {
    var height_ = 0.0;
    double A_l = 0.0;

    try {
      age_ = double.parse(age_);
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
      height_2 = double.parse(height_2);

      if (selectList != "kg") {
        weight_ = convertLbsToKG(weight_);
      } else {
        weight_ = weight_;
      }
      if (selectListHeight == "ft") {
        height_ = convertFt_InToM(height_1, height_2);
      }
      // else {
      //   height_ = convertFt_InToM(height_1, height_2);
      // }

      if (gender == 0) {
        if (selectListActivity == 'Sedentery') {
          A_l = 1.0;
        } else if (selectListActivity == 'Lightly Active') {
          A_l = 1.11;
        } else if (selectListActivity == 'Moderately Active') {
          A_l = 1.25;
        } else if (selectListActivity == 'Very Active') {
          A_l = 1.48;
        }

        if (age_ > 0 && age_ < 9) {
          eer = 88.5 -
              (61.9 * age_) +
              A_l * (26.7 * weight_ + 903 * height_) +
              20;
        } else if (age_ > 8 && age_ < 19) {
          eer = 88.5 -
              (61.9 * age_) +
              A_l * (26.7 * weight_ + 903 * height_) +
              25;
        } else if (age_ > 18) {
          eer = 662 -
              (9.53 * age_) +
              A_l * ((15.91 * weight_) + (539.6 * height_));
        }
        print("eer: ${eer}");
      } else {
        if (selectListActivity == 'Sedentery') {
          A_l = 1.0;
        } else if (selectListActivity == 'Lightly Active') {
          A_l = 1.12;
        } else if (selectListActivity == 'Moderately Active') {
          A_l = 1.27;
        } else if (selectListActivity == 'Very Active') {
          A_l = 1.45;
        }

        if (age_ > 0 && age_ < 9) {
          eer = 135.3 -
              (30.8 * age_) +
              A_l * ((10.0 * weight_) + (934 * height_)) +
              20;
        } else if (age_ > 8 && age_ < 19) {
          eer = 135.3 -
              (30.8 * age_) +
              A_l * ((10.0 * weight_) + (934 * height_)) +
              25;
        } else if (age_ > 18) {
          eer =
              354 - (6.91 * age_) + A_l * ((9.36 * weight_) + (726 * height_));
        }
      }

      return num.parse(eer.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }
}