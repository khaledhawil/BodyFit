import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/BFP/resultScreen.dart';

import '../../Utilies/constants.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/customText.dart';
import '../../Widgets/customTextField.dart';


class BFPCalculator extends StatefulWidget{
  @override
  State<BFPCalculator> createState() => _BFPCalculatorState();
}

class _BFPCalculatorState extends State<BFPCalculator> {
  int gender = 0;
  List<String> list = ['kg', 'lb'];
  String selectList = 'kg';
  List<String> listHeight = ['ft', 'cm'];
  String selectListHeight = 'cm';
  TextEditingController heightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController weistController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  var bfp;
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
                    btnColor: gender == 0?  Color(0xffC1643B):Colors.white,
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
                    btnColor: gender == 1? Color(0xffC1643B):Colors.white,
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
              title: "Neck",
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
                    flex: 4,
                    child: CustomTextField(
                      controller: neckController,
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
                        title: "Inches",
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
              title: "Weist",
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
                    flex: 5,
                    child: CustomTextField(
                      controller: weistController,
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
                        title: "Inches",
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
              title: "Hip",
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
                    flex: 5,
                    child: CustomTextField(
                      controller: hipController,
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
                        title: "Inches",
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
                      setState(() {
                        // getBFP(double.parse(weistController.text),
                        //   //  int.parse(heightController.text),
                        //     double.parse(feetController.text),
                        //     double.parse(inchController.text),
                        //     double.parse(neckController.text),
                        //     double.parse(hipController.text));
                       if(selectListHeight == "cm"){
                          if (heightController.text.isNotEmpty &&
                              neckController.text.isNotEmpty &&
                              weistController.text.isNotEmpty &&
                              hipController.text.isNotEmpty) {
                            getBFP(weistController.text, heightController.text,
                                neckController.text, hipController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BFPResultPage(
                                  bfp: bfp,
                                  headline: headline,
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
                         if (heightController.text.isNotEmpty &&
                             neckController.text.isNotEmpty &&
                             weistController.text.isNotEmpty &&
                             hipController.text.isNotEmpty) {
                           getBFPFt(
                               weistController.text,
                               feetController.text,
                               inchController.text,
                               neckController.text,
                               hipController.text
                           );
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => BFPResultPage(
                               bfp: bfp,
                               headline: headline,
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
                      });
                    },
                    title: "Calculate",
                    textColor: Colors.white,
                    btnColor: Color(0xffC1643B),
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

  converInToCm(inch) {
    return inch * 2.54;
  }

  convertFt_InToCm(ft, inch) {
    return ft * 30.48 + inch * 2.54;
  }

  getBFP(waist_, height_1, neck_, hip_) {
    var bf, height = 0.0;
    double log10(num x) => log(x) / ln10;

    try {
      waist_ = double.parse(waist_);
      height_1 = double.parse(height_1);
      // height_2 = double.parse(height_2);
      neck_ = double.parse(neck_);
      hip_ = double.parse(hip_);

      waist_ = converInToCm(waist_);
      neck_ = converInToCm(neck_);
      hip_ = converInToCm(hip_);
      if (selectListHeight == "cm") {
        height = double.parse(height_1.toString());
      }
      if (gender == 0) {
        // %BF = 495 / ( 1.0324 - 0.19077 * log10( waist - neck ) + 0.15456 * log10( height ) ) - 450
        // double logvalue1 = log10(waist_ - neck_);
        // double logvalue2 = log10(height);
        // double divider = (0.84163 * logvalue1 ) + (0.15456 * logvalue2);
        bfp = 495 /
            (1.0324 -
                0.19077 * log10(waist_ - neck_) +
                0.15456 * log10(height)) -
            450;
        print("bfp print: $bfp");
      } else {
        bf = 1.29579 -
            0.35004 * log10(waist_ + hip_ - neck_) +
            0.22100 * log10(height);
        bfp = (495 / bf) - (450);
      }

      if(bfp!<16.0){
        print("You are very severly UnderWeight");
        print("Very Severly UnderWeight");
        // comment = "";
        headline = "Very severly UnderWeight";
      }else if(bfp >= 16.0 && bfp <16.9){
        print("You are severly UnderWeight.");
        print("severly UnderWeight");
        // comment = "";
        headline = "Severly UnderWeight";
      }else if(bfp > 16.9 && bfp <= 18.4){
        print("You are UnderWeight");
        print("UnderWeight");
        // comment = "You are at overweight.";
        headline = "UnderWeight";
      }else if(bfp > 18.4 && bfp <= 24.9){
        print("You are Normal.");
        print("Normal");
        // comment = "You are obese.";
        headline = "Normal";
      }else if(bfp > 24.9 && bfp <= 29.9){
        print("You are Overweight.");
        print("Overweight");
        // comment = "You are obese.";
        headline = "Overweight";
      } else if(bfp > 29.9 && bfp <= 34.9){
        print("You are Obese class I.");
        print("Obese class I");
        // comment = "You are obese.";
        headline = "Obese Class I";
      } else if(bfp > 34.9 && bfp <= 39.9){
        print("You are Obese class II.");
        print("Obese class II");
        // comment = "You are obese.";
        headline = "Obese Class II";
      }else if(bfp > 39.9){
        print("You are Obese class III.");
        print("Obese class III");
        // comment = "You are obese.";
        headline = "Obese Class III";
      }

      return num.parse(bfp.toStringAsFixed(1));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getBFPFt(waist_, height_1, height_2, neck_, hip_) {
    var bf, height = 0.0;
    double log10(num x) => log(x) / ln10;

    try {
      waist_ = double.parse(waist_);
      height_1 = double.parse(height_1);
      height_2 = double.parse(height_2);
      neck_ = double.parse(neck_);
      hip_ = double.parse(hip_);

      waist_ = converInToCm(waist_);
      neck_ = converInToCm(neck_);
      hip_ = converInToCm(hip_);
      if (selectListHeight == "ft") {
        height = convertFt_InToCm(height_1, height_2);
      }
      if (gender == 0) {
        // %BF = 495 / ( 1.0324 - 0.19077 * log10( waist - neck ) + 0.15456 * log10( height ) ) - 450
        // double logvalue1 = log10(waist_ - neck_);
        // double logvalue2 = log10(height);
        // double divider = (0.84163 * logvalue1 ) + (0.15456 * logvalue2);
        bfp = 495 /
            (1.0324 -
                0.19077 * log10(waist_ - neck_) +
                0.15456 * log10(height)) -
            450;
        print("bfp print: $bfp");
      } else {
        bf = 1.29579 -
            0.35004 * log10(waist_ + hip_ - neck_) +
            0.22100 * log10(height);
        bfp = (495 / bf) - (450);
      }

      if(bfp!<16.0){
        print("You are very severly UnderWeight");
        print("Very Severly UnderWeight");
        // comment = "";
        headline = "Very severly UnderWeight";
      }else if(bfp >= 16.0 && bfp <16.9){
        print("You are severly UnderWeight.");
        print("severly UnderWeight");
        // comment = "";
        headline = "Severly UnderWeight";
      }else if(bfp > 17 && bfp <= 18.4){
        print("You are UnderWeight");
        print("UnderWeight");
        // comment = "You are at overweight.";
        headline = "UnderWeight";
      }else if(bfp > 18.5 && bfp <= 24.9){
        print("You are Normal.");
        print("Normal");
        // comment = "You are obese.";
        headline = "Normal";
      }else if(bfp > 25.0 && bfp <= 29.9){
        print("You are Overweight.");
        print("Overweight");
        // comment = "You are obese.";
        headline = "Overweight";
      } else if(bfp > 30.0 && bfp <= 34.9){
        print("You are Obese class I.");
        print("Obese class I");
        // comment = "You are obese.";
        headline = "Obese Class I";
      } else if(bfp > 35.0 && bfp <= 39.9){
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

      return num.parse(bfp.toStringAsFixed(1));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }
}