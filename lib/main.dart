import 'package:flutter/material.dart';
import 'package:game/support/colors.dart';
import 'package:game/support/string.dart';
import 'package:game/view/home_screen_ui.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MyString.appName,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(color:MyColors.kPrimaryColor ) ,
        hoverColor: Colors.transparent,
        primaryColor: MyColors.kPrimaryColor,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home:HomeScreen(),
    );
  }
}
