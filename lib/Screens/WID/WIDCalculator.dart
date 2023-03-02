import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/WID/resultScreen.dart';
import '../../Utilies/constants.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/customText.dart';
import '../../Widgets/customTextField.dart';

class WIDCalculator extends StatefulWidget {
  @override
  State<WIDCalculator> createState() => _WIDCalculatorState();
}

class _WIDCalculatorState extends State<WIDCalculator> {
  int gender = 0;
  List<String> list = ['kg', 'lb'];
  String selectList = 'kg';
  List<String> listHeight = ['ft', 'cm'];
  String selectListHeight = 'cm';
  List<String> listActivity = ['Sedentery', 'Lightly Active', 'Moderately Active', 'Very Active', 'Extremely Active'];
  String selectListActivity = 'Sedentery';
  List<String> listGoal = ['Maintain Weight', 'Mild Lose Weight', 'Lose Weight', 'Mild Gain Weight', 'Gain Weight'];
  String selectListGoal = 'Maintain Weight';
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var tdee = 0.0;


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
                    btnColor: gender == 0? Color(0xff6cc0e5):Colors.white,
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
                    btnColor: gender == 1? Color(0xff6cc0e5):Colors.white,
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
          // Padding(
          //   padding: kHrPadding,
          //   child: CustomText(
          //     title: "Weight Goal",
          //     fontSize: 15,
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: kHrPadding,
          //   child: Container(
          //     height: 48,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         border: Border.all(color: Colors.grey, width: 2)
          //       //  color: GreyColor
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: DropdownButton(
          //         isExpanded: true,
          //         underline: SizedBox(),
          //         value: selectListGoal,
          //         items: generateItemsActivity(listGoal),
          //         onChanged: (dynamic item) {
          //           setState(() {
          //             selectListGoal = item;
          //           });
          //         },
          //       ),
          //     ),
          //   ),
          // ),
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
                          getTdee(
                              selectListActivity,
                              ageController.text,
                              weightController.text,
                              heightController.text
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WIDResultPage(
                              tdee: tdee,
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
                        print("tdee: ${tdee}");
                      }else{
                        if (ageController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            weightController.text.isNotEmpty) {
                          getTdeeFt(
                              selectListActivity,
                              ageController.text,
                              weightController.text,
                              feetController.text,
                              inchController.text
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WIDResultPage(
                              tdee: tdee,
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
                        print("tdee: ${tdee}");
                      }
                    },
                    title: "Calculate",
                    textColor: Colors.white,
                    btnColor: Color(0xff6cc0e5),
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

  convertFt_InToCm(ft, inch) {
    return ft * 30.48 + inch * 2.54;
  }

  getBmr(age_, weight_, height_1, ) {
    var bmr, height = 0.0;

    try {

      age_ = double.parse(age_);
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
      // height_2 = double.parse(height_2);

      if (list != "kg") {
        weight_ = convertLbsToKG(weight_);
      }
      if (selectListHeight == "cm") {
        // height = convertFt_InToCm(height_1, height_2);
        height = double.parse(height_1.toString());
      }
      if (gender == 0) {
        bmr = (10 * weight_) + (6.25 * height) - 5 * (5 + age_);
        //  print("bmr: ${bmr}");
      } else {
        bmr = (10 * weight_) + (6.25 * height) - (5 + age_) - 161;
      }

      return num.parse(bmr.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getBmrFt(age_, weight_, height_1, height_2) {
    var bmr, height = 0.0;

    try {

      age_ = double.parse(age_);
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
      height_2 = double.parse(height_2);

      if (list != "kg") {
        weight_ = convertLbsToKG(weight_);
      }
      if (selectListHeight == "ft") {
        height = convertFt_InToCm(height_1, height_2);
        // height = double.parse(height_1.toString());
      }
      if (gender == 0) {
        bmr = (10 * weight_) + (6.25 * height) - 5 * (5 + age_);
        //  print("bmr: ${bmr}");
      } else {
        bmr = (10 * weight_) + (6.25 * height) - (5 + age_) - 161;
      }

      return num.parse(bmr.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getTdee(activity, age_, weight_, height_1) {
    try {
      if (activity == 'Sedentery') {
        tdee = getBmr(age_, weight_, height_1) * 2.1;
      } else if (activity == 'Lightly Active') {
        tdee = getBmr(age_, weight_, height_1) * 2.5;
      } else if (activity == 'Moderately Active') {
        tdee = getBmr(age_, weight_, height_1) * 2.8;
      } else if (activity == 'Very Active') {
        tdee = getBmr(age_, weight_, height_1) * 3.3 ;
      }

      return num.parse(tdee.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getTdeeFt(activity, age_, weight_, height_1, height_2) {
    try {
      if (activity == 'Sedentery') {
        tdee = getBmrFt(age_, weight_, height_1, height_2) * 2.1;
      } else if (activity == 'Lightly Active') {
        tdee = getBmrFt(age_, weight_, height_1, height_2) * 2.5;
      } else if (activity == 'Moderately Active') {
        tdee = getBmrFt(age_, weight_, height_1, height_2) * 2.8;
      } else if (activity == 'Very Active') {
        tdee = getBmrFt(age_, weight_, height_1, height_2) * 3.3;
      }

      return num.parse(tdee.toStringAsFixed(0));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }
}