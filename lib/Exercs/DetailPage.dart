import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'Model/Model.dart';
import 'exercisespage.dart';

class DetilPage extends StatefulWidget {
  DetilPage({Key? key, this.exerciesModel}) : super(key: key);

  ExerciesModel? exerciesModel;

  @override
  State<DetilPage> createState() => _DetilPageState();
}

class _DetilPageState extends State<DetilPage> {
  double second = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
      ),
//backgroundColor: Colors.white,
      body: Stack(children: [
        SizedBox(
          height: 50,
        ),
        Container(
          child: CachedNetworkImage(
            imageUrl: "${widget.exerciesModel!.gif}",
            imageBuilder: (context, imageProvider) => Container(
                height: 400,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  // borderRadius: BorderRadius.circular(50)
                ),
                child: Image(image: imageProvider)
                // width: double.infinity,
                //  height: MediaQuery.of(context).size.height / 2,
                ),
          ),
        ),
        Positioned(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            //color: Colors.black12,
          ),
        ),
        Positioned(
          bottom: 100,
          right: 0,
          left: 0,
          child: Column(
            children: [
              SleekCircularSlider(
                innerWidget: (value) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${second.toStringAsFixed(0)} s",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(progressBarWidth: 15),
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.red,
                    )),
                min: 3,
                max: 60,
                initialValue: second,
                onChange: (value) {
                  setState(() {
                    second = value;
                  });
                },
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.2),
                    border: Border.all(color: Colors.red, width: 1)),
                child: MaterialButton(
                  //color: Colors.orange,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ExercisesPage(
                                  title: widget.exerciesModel!.title,
                                  gif: widget.exerciesModel!.gif,
                                  second: second.toInt(),
                                  thumbnail: widget.exerciesModel!.thumbnail,
                                  // location: widget.model!.location,
                                ))));
                  },
                  child: Text("Start"),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
