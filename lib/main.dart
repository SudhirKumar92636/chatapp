
import 'package:chatapp/Config/Themes.dart';
import 'package:chatapp/pages/SplashPage/splashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Config/pagepath.dart';
import 'controller/callcontroller.dart';
import 'firebase_options.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  CallController callController = Get.put(CallController());
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      getPages: pagePath,
      darkTheme:darkTheme,
      themeMode: ThemeMode.dark,
      //home: const AuthPage(),
       home: const SplashScreens(),
    );
  }
}