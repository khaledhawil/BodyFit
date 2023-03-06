import 'package:flutter/material.dart';

import '../../Utilies/constants.dart';
import '../../Widgets/customText.dart';

class ResultPage extends StatefulWidget {
  final double? bmi;
  final String? headline;

  const ResultPage({super.key, this.bmi, this.headline});
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late double bmiResult;
  var headlineResult = "";
  @override
  void initState() {
    bmiResult = widget.bmi!;
    headlineResult = widget.headline!;
    print("BMI: ${bmiResult}");
    print("Headline: ${headlineResult}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Result",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
              child: CustomText(
            title: "Your Body Mass Index Is",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
            title: "${bmiResult.toStringAsFixed(3)}",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff98DB63),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
            title: "${headlineResult}",
            fontSize: 25,
            color: Color(0xff98DB63),
          )),
          SizedBox(
            height: 20,
          ),
          RadialGuage(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! < 16.0)
                    ? Colors.blue.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Expanded(child: Text("Very severly UnderWeight")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight, child: Text("<16.0")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! >= 16.0 && widget.bmi! < 16.9)
                    ? Colors.blue.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Expanded(child: Text("severly UnderWeight")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("16.0-16.9")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 17 && widget.bmi! <= 18.4)
                    ? Colors.blue.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Expanded(child: Text("UnderWeight")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("17.0-18.4")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 18.5 && widget.bmi! <= 24.9)
                    ? Colors.green.shade300
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.green,
                    size: 15,
                  ),
                  Expanded(child: Text("Normal")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("18.5-24.9")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 25.0 && widget.bmi! <= 29.9)
                    ? Colors.orange.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.orange,
                    size: 15,
                  ),
                  Expanded(child: Text("Overweight")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("25.0-29.9")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 30.0 && widget.bmi! <= 34.9)
                    ? Colors.orange.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.orange,
                    size: 15,
                  ),
                  Expanded(child: Text("Obese Class I")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("30.0-34.9")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 35.0 && widget.bmi! <= 39.9)
                    ? Colors.red.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.red,
                    size: 15,
                  ),
                  Expanded(child: Text("Obese Class II")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("35.0-39.9")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bmi! > 40.0)
                    ? Colors.red.shade100
                    : Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: Colors.red,
                    size: 15,
                  ),
                  Expanded(child: Text("Obese class III")),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight, child: Text(">40.0")))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffd78d14),
                borderRadius:
                BorderRadius.circular(20)),
            child: MaterialButton(

              onPressed: () {
                Navigator.pushNamed(context, 'meals');
              },
              child: Text('Go to Nutrition'),
            ),
          )
        ],
      ),
    );
  }

  double angle = 12.57;
  String bmi_category = "";

  double pixelHeight = 1;
  double pixelWidth = 1;

  RadialGuage() {
    if (widget.bmi! < 16.0) {
      angle = 11.00;
    } else if (widget.bmi! >= 16.0 && widget.bmi! < 18.5) {
      angle = 11.20;
    } else if (widget.bmi! >= 18.5 && widget.bmi! < 25.0) {
      angle = 11.57;
    } else if (widget.bmi! >= 25.0 && widget.bmi! < 30.0) {
      angle = 12.70;
    } else if (widget.bmi! >= 30.0 && widget.bmi! < 40.0) {
      angle = 13.70;
    } else if (widget.bmi! > 40.0) {
      angle = 14.00;
    }

    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [
          Image.asset(
            "assets/images/groupmeter.png",
            height: pixelHeight * 136,
          ),
          Container(
            padding: EdgeInsets.only(
              top: pixelHeight * 45,
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Transform.rotate(
              angle: angle,
              child: Container(
                //   margin: EdgeInsets.only(top: 25),
                child: Image.asset(
                  "assets/images/needle_box.webp",
                  height: pixelHeight * 160,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
