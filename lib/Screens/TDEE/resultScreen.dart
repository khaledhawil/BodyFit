import 'package:flutter/material.dart';
import '../../Utilies/constants.dart';
import '../../Widgets/customText.dart';

class TDEEResultPage extends StatefulWidget{
  final double? tdee;

  const TDEEResultPage({super.key, this.tdee});
  @override
  State<TDEEResultPage> createState() => _TDEEResultPageState();
}

class _TDEEResultPageState extends State<TDEEResultPage> {
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
            title: "Your TDEE",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 10,
          ),
          Center(child: CustomText(
            title: "(Daily Excerise Expenditure)",
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
                          title: "${tdeeResult.toStringAsFixed(3)}",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD82D62),
                        )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: CustomText(
                          title: "Calories/Day",
                          fontSize: 25,
                          color: Color(0xffD82D62),
                        )
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CustomText(
                          title: "${weeklyTDEEResult.toStringAsFixed(1)}",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD82D62),
                        )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: CustomText(
                          title: "Calories/Week",
                          fontSize: 25,
                          color: Color(0xffD82D62),
                        )
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}