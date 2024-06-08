import 'package:chatapp/Config/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomesScreens extends StatefulWidget {
  const WelcomesScreens({Key? key}) : super(key: key);

  @override
  State<WelcomesScreens> createState() => _WelcomesScreensState();
}

class _WelcomesScreensState extends State<WelcomesScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Image.asset("assets/Icons/app.png"),
               ],
             ),

              Text(AppStrings.appName,style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/boy.png"),
                  Image.asset("assets/images/girl.png"),
                ],
              ),

              Text(WelcomePage.nouYouAre,style:Theme.of(context).textTheme.headlineMedium ,),
              Text(WelcomePage.connected,style:Theme.of(context).textTheme.headlineLarge ,),

              Text(WelcomePage.discrition,style:Theme.of(context).textTheme.labelLarge ,textAlign: TextAlign.center,),

              SlideAction(
                onSubmit: (){
                  Get.offAllNamed("/authPage");
                },
                innerColor: Colors.white,
                outerColor: Colors.grey,
                sliderRotate: true,
                text: WelcomePage.slideToStart,textStyle: const TextStyle(color: Colors.white),
                 animationDuration: const Duration(seconds: 2),

              )
            ],
          ),
        ),
      ),
    );
  }
}
