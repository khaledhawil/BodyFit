import 'package:flutter/material.dart';

import '../../Utilies/constants.dart';
import '../../Widgets/customText.dart';

class WIDResultPage extends StatefulWidget{
  final double? tdee;

  const WIDResultPage({super.key,this.tdee});
  @override
  State<WIDResultPage> createState() => _WIDResultPageState();
}

class _WIDResultPageState extends State<WIDResultPage> {

  late double tdeeResult;
  late double weeklyTDEEResult;
  var headlineResult = "";
  @override
  void initState() {
    tdeeResult = widget.tdee!;
    weeklyTDEEResult = tdeeResult*7;
    print("BMI: ${tdeeResult}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Result", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(child: CustomText(
            title: "Your WID",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 10,
          ),
          Center(child: CustomText(
            title: "(Daily Water Intake)",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CustomText(
                          title: "${tdeeResult.toStringAsFixed(0)} ml",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6cc0e5),
                        )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: CustomText(
                          title: "Water Intake/Day",
                          fontSize: 25,
                          color: Color(0xff6cc0e5),
                        )
                    ),
                  ],
                ),
              ),

              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // Center(
              //       //     child: CustomText(
              //       //       title: "${weeklyTDEEResult.toStringAsFixed(1)}",
              //       //       fontSize: 30,
              //       //       fontWeight: FontWeight.bold,
              //       //       color: Color(0xff6cc0e5),
              //       //     )
              //       // ),
              //       // SizedBox(
              //       //   height: 15,
              //       // ),
              //       // Center(
              //       //     child: CustomText(
              //       //       title: "Calories/Week",
              //       //       fontSize: 25,
              //       //       color: Color(0xff6cc0e5),
              //       //     )
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: Container(
              height: 600,
              width: double.infinity,
              child: Image.asset('assets/balance-of-water.jpg'),
            ),
          )
        ],
      ),
    );
  }
  //
  // double angle = 12.57;
  // String bmi_category = "";
  //
  // double pixelHeight = 1;
  // double pixelWidth = 1;
  //
  // RadialGuage() {
  //   if (widget.whr! < 0.34) {
  //     angle = 11.00;
  //   } else if (widget.whr! >= 0.35 && widget.whr! < 0.42) {
  //     angle = 11.30;
  //   } else if (widget.whr! >= 0.43 && widget.whr! < 0.52) {
  //     angle = 11.87;
  //   } else if (widget.whr! >= 0.53 && widget.whr! < 0.62) {
  //     angle = 12.70;
  //   } else if (widget.whr! > 0.62) {
  //     angle = 13.80;
  //   }
  //
  //   return Container(
  //
  //     child: Stack(
  //       alignment: Alignment.topCenter,
  //       fit: StackFit.loose,
  //       children: [
  //
  //         Image.asset(
  //           "assets/images/groupmeter.png",
  //           height: pixelHeight * 136,
  //         ),
  //         Container(
  //           padding: EdgeInsets.only(top: pixelHeight * 50,),
  //           margin: EdgeInsets.only(left: 10, right: 10),
  //           child: Transform.rotate(
  //             angle: angle,
  //             child: Container(
  //               //   margin: EdgeInsets.only(top: 25),
  //               child: Image.asset(
  //                 "assets/images/needle_box.webp",
  //                 height: pixelHeight * 160,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
}