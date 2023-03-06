import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'DetailPage.dart';
import 'Model/Model.dart';

class GridDemo extends StatefulWidget {
  const GridDemo({Key? key}) : super(key: key);

  @override
  State<GridDemo> createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  @override
  void dispose() {
    super.dispose();
    //_bottomBannerAd.dispose();
  }

  //end ad
  //api
  String link =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR1GLJ073KwOsgAxkIRiZq2GnNS-Z3TROR8jpv3cwvtjpBxOSqAwphf8tpU";

  List<ExerciesModel> allData = [];
  late ExerciesModel exerciesModel;

  bool isLoading = false;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    var responce = await http.get(Uri.parse(link));
    print("status code is ${responce.statusCode}");
    print("${responce.body}");
    if (responce.statusCode == 200) {
      final item = jsonDecode(responce.body);
      for (var data in item["exercises"]) {
        exerciesModel = ExerciesModel(
            id: data["id"],
            gif: data["gif"],
            seconds: data["seconds"],
            thumbnail: data["thumbnail"],
            title: data["title"]);
        setState(() {
          allData.add(exerciesModel);
        });
      }

      print("total length is ${allData.length}");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    //banner ad
    super.initState();
    // _createBottomBannerAd();
    // TODO: implement initState
    fetchData();
    /* Future.delayed(Duration(seconds: 3), () {

    });*/
    super.initState();
  }
//eng api

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Exercises Page',
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),
        body: Container(
            child: GridView.builder(
          itemCount: allData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetilPage(
                          exerciesModel: allData[index],
                        )));

              },
              child: CachedNetworkImage(
                imageUrl: "${allData[index].gif}",
                // fit: BoxFit.cover,
                //       width: double.infinity,
                imageBuilder: (context, imageProvider) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image(image: imageProvider,
                        fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        // Image.network(
                        //   "${allData[index].gif}",
                        //   fit: BoxFit.cover,
                        //   width: double.infinity,
                        // ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              height: 80,
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "${allData[index].title}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Colors.black12,
                                    Colors.black54,
                                    Colors.black87,
                                    Colors.black
                                  ])),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
