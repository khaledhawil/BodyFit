import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/BMI/resultScreen.dart';

import '../../Utilies/constants.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/customText.dart';
import '../../Widgets/customTextField.dart';


class BMICalculator extends StatefulWidget{
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int gender = 0;
  List<String> list = ['kg', 'lb'];
  String selectList = 'kg';
  List<String> listHeight = ['ft', 'cm'];
  String selectListHeight = 'cm';
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var bmi;
  String headline = '';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Form(
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
                      btnColor: gender == 0? Color(0xff98DB63):whiteColor,
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
                      btnColor: gender == 1? Color(0xff98DB63):whiteColor,
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
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Required this field';
                          }
                          return null;
                        },
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
                ),
                child: Row(
                  children: [
                    (selectListHeight == "cm")? Expanded(
                      flex: 5,
                      child: CustomTextField(
                        controller: heightController,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Required this field';
                          }
                          return null;
                        },
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
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required this field';
                                  }
                                  return null;
                                },
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
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required this field';
                                  }
                                  return null;
                                },
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
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Required this field';
                          }
                          return null;
                        },
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
                         if(ageController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty){
                           getBMI(
                               weightController.text,
                               heightController.text
                           );
    
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ResultPage(
                             bmi: bmi,
                             headline: headline,
                              ),
                             ),
                           );
                         }else{
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
                         if(ageController.text.isNotEmpty && feetController.text.isNotEmpty && inchController.text.isNotEmpty && weightController.text.isNotEmpty){
                           getBMIFt(
                             weightController.text,
                             feetController.text,
                             inchController.text
                           );
    
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ResultPage(
                               bmi: bmi,
                               headline: headline,
                             ),
                             ),
                           );
                         }else{
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
                     //   bmiResult(int.parse(feetController.text), int.parse(inchController.text), int.parse(weightController.text));
                        // bmiResult(int.parse(heightController.text), int.parse(weightController.text));
                      },
                      title: "Calculate",
                      textColor: Colors.white,
                      btnColor: Color(0xff98DB63),
                      btnRadius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  convertLbsToKG(value) {
    return value / 2.205;
  }

  convertCmToM(value) {
    return value / 100;
  }

  convertFt_InToM(ft, inch) {
    return ft / 3.281 + inch / 39.37;
  }

  getBMI(weight_, height_1) {
    var height;
    try {
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
  //    height_2 = double.parse(height_2);

      if (selectList != "kg") {
        weight_ = convertLbsToKG(weight_);
      }

      if (selectListHeight == "cm") {
        height = convertCmToM(height_1);
      }
      // else {
      //   height = convertFt_InToM(height_1, height_2);
      // }

      height = height * height;
      bmi = weight_ / height;
      print("bmi: $bmi");
      if(bmi!<16.0){
        print("You are very severly UnderWeight");
        print("Very Severly UnderWeight");
        // comment = "";
        headline = "Very severly UnderWeight";
      }else if(bmi >= 16.0 && bmi <16.9){
        print("You are severly UnderWeight.");
        print("severly UnderWeight");
        // comment = "";
        headline = "Severly UnderWeight";
      }else if(bmi > 17 && bmi <= 18.4){
        print("You are UnderWeight");
        print("UnderWeight");
        // comment = "You are at overweight.";
        headline = "UnderWeight";
      }else if(bmi > 18.5 && bmi <= 24.9){
        print("You are Normal.");
        print("Normal");
        // comment = "You are obese.";
        headline = "Normal";
      }else if(bmi > 25.0 && bmi <= 29.9){
        print("You are Overweight.");
        print("Overweight");
        // comment = "You are obese.";
        headline = "Overweight";
      } else if(bmi > 30.0 && bmi <= 34.9){
        print("You are Obese class I.");
        print("Obese class I");
        // comment = "You are obese.";
        headline = "Obese Class I";
      } else if(bmi > 35.0 && bmi <= 39.9){
        print("You are Obese class II.");
        print("Obese class II");
        // comment = "You are obese.";
        headline = "Obese Class II";
      }else{
        print("You are Obese class III.");
        print("Obese class III");
        // comment = "You are obese.";
        headline = "Obese Class III";
      }
      return num.parse(bmi.toStringAsFixed(1));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getBMIFt(weight_, height_1, height_2) {
    var height;
    try {
      weight_ = double.parse(weight_);
      height_1 = double.parse(height_1);
      height_2 = double.parse(height_2);

      if (selectList != "kg") {
        weight_ = convertLbsToKG(weight_);
      }

      if (selectListHeight == "ft") {
        height = convertFt_InToM(height_1, height_2);
      }
      // else {
      //   height = convertFt_InToM(height_1, height_2);
      // }

      height = height * height;
      bmi = weight_ / height;
      print("bmi: $bmi");
      if(bmi!<16.0){
        print("You are very severly UnderWeight");
        print("Very Severly UnderWeight");
        // comment = "";
        headline = "Very severly UnderWeight";
      }else if(bmi >= 16.0 && bmi <16.9){
        print("You are severly UnderWeight.");
        print("severly UnderWeight");
        // comment = "";
        headline = "Severly UnderWeight";
      }else if(bmi > 16.9 && bmi <= 18.4){
        print("You are UnderWeight");
        print("UnderWeight");
        // comment = "You are at overweight.";
        headline = "UnderWeight";
      }else if(bmi > 18.4 && bmi <= 24.9){
        print("You are Normal.");
        print("Normal");
        // comment = "You are obese.";
        headline = "Normal";
      }else if(bmi > 24.9 && bmi <= 29.9){
        print("You are Overweight.");
        print("Overweight");
        // comment = "You are obese.";
        headline = "Overweight";
      } else if(bmi > 29.9 && bmi <= 34.9){
        print("You are Obese class I.");
        print("Obese class I");
        // comment = "You are obese.";
        headline = "Obese Class I";
      } else if(bmi > 34.9 && bmi <= 39.9){
        print("You are Obese class II.");
        print("Obese class II");
        // comment = "You are obese.";
        headline = "Obese Class II";
      }else if(bmi > 39.9){
        print("You are Obese class III.");
        print("Obese class III");
        // comment = "You are obese.";
        headline = "Obese Class III";
      }
      return num.parse(bmi.toStringAsFixed(1));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }
}