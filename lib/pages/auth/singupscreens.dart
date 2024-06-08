import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authcontroller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller:nameController ,
          decoration: const InputDecoration(
            hintText: 'Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller:emailController ,
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_rounded),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller:passwordController,
          decoration: const InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Obx(() =>authController.isLoading.value ?const CircularProgressIndicator(): ElevatedButton(
          onPressed: () {
            authController.createUser(emailController.text ,passwordController.text,nameController.text ,);
          },
          child: const Text('SignUp'),
        ),
        )
      ],
    );
  }
}
