import 'package:chatapp/controller/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  SplashController splashController =  Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Splash Screens",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/chat.png"),
          maxRadius: 100,
        ),
      )
    );
  }
}