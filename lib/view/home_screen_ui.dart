import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/home_screen_controller.dart';
import 'package:game/support/colors.dart';
import 'package:game/support/images.dart';
import 'package:game/widgets/custom_password_field.dart';
import 'package:game/widgets/customize_text_field.dart';
import 'package:game/widgets/game_card.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:textfield_search/textfield_search.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        // backgroundColor: MyColors.kPrimaryColor,
        appBar: AppBar(
          leadingWidth: 350,
          leading:  Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Center(
                    child: Image.asset(MyImages.logo,width: 80,),),

              ],
            ),
          ),
          elevation: 10,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 40),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children:  [
                      const Text(
                        "HOME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.kSecondaryColor),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      PopupMenuButton<int>(
                        child: const Center(
                          child:  Text(
                            "LIBRARY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.kSecondaryColor),
                          ),
                        ),
                        onSelected: (value) {

                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 1,
                            child: Text("PlayStation Vita"),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Text("iPad"),
                          ),
                          const PopupMenuItem(
                            value: 3,
                            child: Text("Xbox 360"),
                          ),
                          const PopupMenuItem(
                            value: 4,
                            child: Text("PlayStation 3"),
                          ),
                          const PopupMenuItem(
                            value: 5,
                            child: Text("Macintosh"),
                          ),
                          const PopupMenuItem(
                            value: 6,
                            child: Text("PC"),
                          ),
                          const PopupMenuItem(
                            value: 7,
                            child: Text("iPhone"),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 40,
                      ),
                      PopupMenuButton<int>(
                        child: const Center(
                          child:  Text(
                            "COMMUNITY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.kSecondaryColor),
                          ),
                        ),
                        onSelected: (value) {

                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 1,
                            child: Text("Platformer"),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Text("Puzzle"),
                          ),
                          const PopupMenuItem(
                            value: 3,
                            child: Text("Sports"),
                          ),
                          const PopupMenuItem(
                            value: 4,
                            child: Text("Strategy"),
                          ),
                          const PopupMenuItem(
                            value: 5,
                            child: Text("Fighting"),
                          ),
                          const PopupMenuItem(
                            value: 6,
                            child: Text("RPG"),
                          ),
                          const PopupMenuItem(
                            value: 7,
                            child: Text("Action"),
                          ),
                          const PopupMenuItem(
                            value: 8,
                            child: Text("Adventure"),
                          ),
                          const PopupMenuItem(
                            value: 9,
                            child: Text("Shooter"),
                          ),
                          const PopupMenuItem(
                            value: 10,
                            child: Text("Music"),
                          ),
                          const PopupMenuItem(
                            value: 11,
                            child: Text("Racing"),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        onTap: (){
                          contactInfo(context);
                        },
                        child: const Text(
                          "CONTACT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.kSecondaryColor),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: TextFieldSearch(
                  initialList: controller.gameNameList,
                  textStyle: const TextStyle(color: MyColors.kSecondaryColor),
                  label: 'Search by name',
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    hintStyle: TextStyle(color: MyColors.kSecondaryColor),
                    labelStyle: TextStyle(color: MyColors.kSecondaryColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  controller: controller.myController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // style:ElevatedButton.styleFrom(textStyle: const TextStyle(color: MyColors.lightGray,fontWeight: FontWeight.bold),primary: MyColors.kPrimaryColor,minimumSize: Size(MediaQuery.of(context).size.width*.80, 50) ),
                onPressed: () {
                  _onAlertSignIn(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Sign in"),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // style:ElevatedButton.styleFrom(textStyle: const TextStyle(color: MyColors.lightGray,fontWeight: FontWeight.bold),primary: MyColors.kPrimaryColor,minimumSize: Size(MediaQuery.of(context).size.width*.80, 50) ),
                onPressed: () {
                  _onAlertSignUp(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Sign up"),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages.bg), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        items: controller.imageSliders,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 5,
                          child: Drawer(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView(
                                    padding:
                                        const EdgeInsets.only(left: 10, right: 10),
                                    children: [
                                     const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Platform",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("PlayStation Vita"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Macintosh"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("iPad"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Xbox 360"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("PlayStation 3"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("PC"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("iPhone"),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text(
                                        "Genre",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Platformer"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Puzzle"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Sports"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Strategy"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Fighting"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("RPG"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Action"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Adventure"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Shooter"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Music"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              side: const BorderSide(
                                                color: MyColors.lightGray,
                                                width: 1.5,
                                              ),
                                            ),
                                            side: const BorderSide(
                                              color: MyColors.lightGray,
                                              width: 1.5,
                                            ),
                                            checkColor: MyColors.kPrimaryColor,
                                            activeColor:
                                                MyColors.kSecondaryColor,
                                            value: true,
                                            onChanged: (value) {
                                              // controller.checkMail.value = value!;
                                            },
                                          ),
                                          const Text("Racing"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                  width: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                        controller.onSearch.value
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    controller: controller.scrollController,
                                    itemCount: 1,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 4.0,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GameCard(
                                          controller.gameResponse.value[
                                              controller.selectedValue.value],
                                          controller.gameImages[
                                              Random().nextInt(17)]);
                                    }),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    controller: controller.scrollController,
                                    // scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.gameResponse.value.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 4.0,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GameCard(
                                          controller.gameResponse.value[index],
                                          controller.gameImages[
                                              Random().nextInt(17)]);
                                    }),
                              )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  contactInfo(context) {
    Alert(
        context: context,
        style: const AlertStyle(
            titleStyle: TextStyle(
                color: MyColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            descStyle: TextStyle(fontSize: 12)),
        title: "Contact Info",
        closeIcon: const Icon(
          Icons.cancel,
          color: MyColors.kPrimaryColor,
        ),
        content: Column(
          children: const [
            SizedBox(
              height: 5,
            ),
            Text("Name: Ganesh kumar B"),
            SizedBox(
              height: 10,
            ),
            Text("Number: 8148184171"),
            SizedBox(
              height: 10,
            ),
            Text("Mail: ganeshkumarbk123@gmail.com"),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      buttons: []
        ).show();
  }
  _onAlertSignIn(context) {
    Alert(
        context: context,
        style: const AlertStyle(
            titleStyle: TextStyle(
                color: MyColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            descStyle: TextStyle(fontSize: 12)),
        title: "Sign in",
        closeIcon: const Icon(
          Icons.cancel,
          color: MyColors.kPrimaryColor,
        ),
        content: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomizeTextFormField(
              controller: TextEditingController(),
              onChange: (String) {},
              onClick: () {},
              onSave: (String) {},
              labelText: 'Username',
              helperText: 'Username',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPasswordTextField(
             controller: TextEditingController(),
              onChange: (String) {},
              onSave: (String) {},
              labelText: 'Password',
              helperText: 'Password',
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: MyColors.kPrimaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Sign in",
              style: TextStyle(color: MyColors.white, fontSize: 16),
            ),
          )
        ]).show();
  }

  _onAlertSignUp(context) {
    Alert(
        context: context,
        style: const AlertStyle(
            titleStyle: TextStyle(
                color: MyColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            descStyle: TextStyle(fontSize: 12)),
        title: "Sign up",
        closeIcon: const Icon(
          Icons.cancel,
          color: MyColors.kPrimaryColor,
        ),
        content: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomizeTextFormField(
              controller: TextEditingController(),
              onChange: (String) {},
              onClick: () {},
              onSave: (String) {},
              labelText: 'Username',
              helperText: 'Username',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomizeTextFormField(
              controller: TextEditingController(),
              onChange: (String) {},
              onClick: () {},
              onSave: (String) {},
              labelText: 'Email',
              helperText: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPasswordTextField(
              controller: TextEditingController(),
              onChange: (String) {},
              onSave: (String) {},
              labelText: 'Password',
              helperText: 'Password',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPasswordTextField(
             controller: TextEditingController(),
              onChange: (String) {},
              onSave: (String) {},
              labelText: 'Conform Password',
              helperText: 'Conform Password',
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: MyColors.kPrimaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Sign up",
              style: TextStyle(color: MyColors.white, fontSize: 16),
            ),
          )
        ]).show();
  }
}
