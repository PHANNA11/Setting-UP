import 'package:app1/main.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateWhere: true,
        navigateRoute: const MyHomePage(title: 'Flutter Demo Home Page'),
        text: WavyAnimatedText(
          "Flutter Setting learning",
          textStyle: const TextStyle(
            color: Colors.red,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        imageSrc: "assets/jsons/136779-carnival-archery.json",
        //  displayLoading: false,
      ),
    );
  }
}
