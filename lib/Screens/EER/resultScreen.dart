import 'package:flutter/material.dart';
import '../../Utilies/constants.dart';
import '../../Widgets/customText.dart';

class EERResultPage extends StatefulWidget{
  final double? eer;

  const EERResultPage({super.key, this.eer});
  @override
  State<EERResultPage> createState() => _EERResultPageState();
}

class _EERResultPageState extends State<EERResultPage> {
  late double eerResult;
  var headlineResult = "";
  @override
  void initState() {
    eerResult = widget.eer!;
    print("BMI: ${eerResult}");
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
            title: "Your EER",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 10,
          ),
          Center(child: CustomText(
            title: "(Estimated Energy Requirement)",
            fontSize: 18,
            color: blackColor,
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "${eerResult.toStringAsFixed(3)}",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffC9312F),
              )
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "Calories/Day",
                fontSize: 25,
                color: Color(0xffC9312F),
              )
          ),
        ],
      ),
    );
  }
}