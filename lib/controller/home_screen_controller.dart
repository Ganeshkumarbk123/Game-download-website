import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:game/model/game_response.dart';
import 'package:game/service/api_manager.dart';
import 'package:game/service/endpoints.dart';
import 'package:game/support/images.dart';

import 'package:get/get.dart';


class HomeController extends GetxController {


  TextEditingController guardNameController = TextEditingController();
  var gameResponse = [].obs;
  List<GameResponse> gameList = [];
  List<String> gameNameList = [];
  var selectedValue = 0.obs;
  var onSearch = false.obs;
  dynamic iniSearchValue = "".obs;
  final scrollController = ScrollController();
  late List<Widget> imageSliders;
  TextEditingController myController = TextEditingController();

  List<String> images = [
    MyImages.slide1,
    MyImages.slide2,
    MyImages.slide3,
    MyImages.slide4,
    MyImages.slide5,
    MyImages.slide6
  ];
  List<String> gameImages = [
    MyImages.image1,
    MyImages.image2,
    MyImages.image3,
    MyImages.image4,
    MyImages.image5,
    MyImages.image6,
    MyImages.image7,
    MyImages.image8,
    MyImages.image9,
    MyImages.image10,
    MyImages.image11,
    MyImages.image12,
    MyImages.image13,
    MyImages.image14,
    MyImages.image15,
    MyImages.image16,
    MyImages.image17
  ];


  @override
  void onInit() {
    super.onInit();
    myController.addListener(_printLatestValue);
    imageSliders = images.map((item) =>
        Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${images.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
        .toList();


    getGame();
  }

  _printLatestValue() {
    print("text field: ${myController.text}");
    if (myController.text.isNotEmpty &&
        gameNameList.contains(myController.text)) {
      selectedValue.value =
          gameNameList.indexOf(myController.text);
      onSearch.value = true;
    } else {
      onSearch.value = false;
    }
  }


  @override
  void onClose() {
    myController.dispose();
  }

  void getGame() async {
    try {
      await ApiManager()
          .getDio()!
          .get(Endpoints.baseUrl)
          .then((response) => regionResponses(response))
          .catchError((onError) {
        print(onError);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> regionResponses(dio.Response response) async {
    gameList = [];
    gameNameList = [];
    for (int i = 1; i < response.data.length; i++) {
      gameList.add(GameResponse.fromJson(response.data[i]));
      gameNameList.add(GameResponse
          .fromJson(response.data[i])
          .title ?? "");
    }
    gameResponse.value = gameList;
  }


}
