
import 'package:chatapp/controller/authcontroller.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  RxBool isLoading = false.obs;
  AuthController authController = Get.put(AuthController());
  final auth = FirebaseAuth.instance;
  ProfileController profileController = Get.put(ProfileController());
  
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [

        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_rounded),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
       Obx(() => authController.isLoading.value ?const CircularProgressIndicator():
       ElevatedButton(
           onPressed: () {
             authController.login(emailController.text, passwordController.text);

           },
           child: const Text('Login'),
         ),
       ),
      ],
    );
  }
}