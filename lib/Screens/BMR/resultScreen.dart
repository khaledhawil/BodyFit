import 'package:flutter/material.dart';
import '../../Utilies/constants.dart';
import '../../Widgets/customText.dart';


class BMRResultPage extends StatefulWidget{
  final double? bmr;

  const BMRResultPage({super.key, this.bmr});
  @override
  State<BMRResultPage> createState() => _BMRResultPageState();
}

class _BMRResultPageState extends State<BMRResultPage> {
  late double bmrResult;
  var headlineResult = "";
  @override
  void initState() {
    bmrResult = widget.bmr!;
    print("BMI: ${bmrResult}");
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
          Center(child: CustomText(
            title: "Basal Metabolic Rate (BMR)",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "${bmrResult.toStringAsFixed(3)}",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff5086CB),
              )
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "Calories/Day",
                fontSize: 25,
                color: Color(0xff5086CB),
              )
          ),
        ],
      ),
    );
  }
}