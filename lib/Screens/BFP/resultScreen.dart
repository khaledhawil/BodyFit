import 'package:flutter/material.dart';

import '../../Widgets/customText.dart';

class BFPResultPage extends StatefulWidget {
  final double? bfp;
  final String? headline;

  const BFPResultPage({super.key, this.bfp, this.headline});
  @override
  State<BFPResultPage> createState() => _BFPResultPageState();
}

class _BFPResultPageState extends State<BFPResultPage> {
  late double bfpResult;
  var headlineResult = "";
  @override
  void initState() {
    bfpResult = widget.bfp!;
    headlineResult = widget.headline!;
    print("BMI: ${bfpResult}");
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
          SizedBox(
            height: 10,
          ),
          Center(
              child: CustomText(
            title: "Body Fat Percentage(BFP)",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
            title: "${bfpResult.toStringAsFixed(3)}",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xffC1643B),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
            title: "${headlineResult}",
            fontSize: 25,
            color: Color(0xffC1643B),
          )),
          SizedBox(
            height: 20,
          ),
          RadialGuage(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.bfp! < 16.0)
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
                color: (widget.bfp! >= 16.0 && widget.bfp! < 16.9)
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
                color: (widget.bfp! > 17 && widget.bfp! <= 18.4)
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
                color: (widget.bfp! > 18.5 && widget.bfp! <= 24.9)
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
                color: (widget.bfp! > 25.0 && widget.bfp! <= 29.9)
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
                color: (widget.bfp! > 30.0 && widget.bfp! <= 34.9)
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
                color: (widget.bfp! > 35.0 && widget.bfp! <= 39.9)
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
                color: (widget.bfp! > 40.0)
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
        ],
      ),
    );
  }

  double angle = 12.57;
  String bmi_category = "";

  double pixelHeight = 1;
  double pixelWidth = 1;

  RadialGuage() {
    if (widget.bfp! < 16.0) {
      angle = 11.00;
    } else if (widget.bfp! >= 16.0 && widget.bfp! < 18.5) {
      angle = 11.20;
    } else if (widget.bfp! >= 18.5 && widget.bfp! < 25.0) {
      angle = 11.57;
    } else if (widget.bfp! >= 25.0 && widget.bfp! < 30.0) {
      angle = 12.70;
    } else if (widget.bfp! >= 30.0 && widget.bfp! < 40.0) {
      angle = 13.70;
    } else if (widget.bfp! > 40.0) {
      angle = 14.50;
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
            padding: EdgeInsets.only(top: pixelHeight * 50,),
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
