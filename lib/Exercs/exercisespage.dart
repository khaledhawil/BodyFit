import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Model/Model.dart';



class ExercisesPage extends StatefulWidget {
  ExerciesModel? exerciesModel;
  String? id, title, thumbnail, gif;

  int? second;

  ExercisesPage(
      {Key? key,
      this.exerciesModel,
      this.gif,
      this.id,
      this.second,
      this.thumbnail,
      this.title})
      : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  bool isPlyaing = false;
  bool isComplite = false;
  int startSound = 0;
  String audioPath = 'audio.mp3';
  late Timer timer;
  void playAudio() async {
    await audioCache.play(audioPath);
    print('playing');
  }

  @override
  void initState() {
//ad
    super.initState();
    //_createBottomBannerAd();
    //end

    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == widget.second) {
        timer.cancel();
        setState(() {
          isComplite == true;
          playAudio();
          Navigator.of(context).pop();
        });
      }
      setState(() {
        startSound = timer.tick;
      });
    });
    super.initState();
  }

  //ad
  // late BannerAd _bottomBannerAd;
  // bool _isBottomBannerAdLoaded = false;
  // void _createBottomBannerAd() {
  //   _bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.bannerAdUnitId,
  //     size: AdSize.banner,
  //     request: AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         setState(() {
  //           _isBottomBannerAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   _bottomBannerAd.load();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _bottomBannerAd.dispose();
  // }
  //
  // //end ad

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Column(
              children: [
            SizedBox(
              height: 40,
            ),
                Container(
                  child: CachedNetworkImage(
                    imageUrl: '${widget.gif}',
                    imageBuilder: (context, imageProvider) => Container(
                        height: 400,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 80),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Image(image: imageProvider)
                      // width: double.infinity,
                      //  height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Time Start',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.green[500],
              child: Text(
                '${startSound} / ${widget.second!.toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.green,
                borderRadius:BorderRadius.circular(20.2),
                border: Border.all(color: Colors.green,width: 1)
              ),
              child: MaterialButton(
                //color: Colors.orange,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("End Now",style: TextStyle(fontSize: 18),),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        ],
      ),
    );
  }
}
