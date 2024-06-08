import 'package:chatapp/pages/auth/singupscreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Config/strings.dart';
import 'loginscreens.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();}

class _AuthPageState extends State<AuthPage> {
  RxBool isLogin =true.obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Screens"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/Icons/app.png"),
                    ],
                  ),
                  Text(
                    AppStrings.appName,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child:  Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                          Obx(() =>   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  isLogin.value = true;

                                },
                                child: Column(
                                  children: [
                                    Text("Login",style: Theme.of(context).textTheme.bodyLarge,),
                                    AnimatedContainer(duration: const Duration(microseconds: 200),
                                      width:isLogin.value ?100 :0 ,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Theme.of(context).colorScheme.primary,

                                      ),),


                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  isLogin.value = false;

                                },
                                child: Column(
                                  children: [
                                    Text("singup",style: Theme.of(context).textTheme.bodyLarge,),
                                    AnimatedContainer(duration: const Duration(seconds: 2),
                                      width:isLogin.value ?0 :100 ,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Theme.of(context).colorScheme.primary,

                                      ),)

                                  ],),)],)),
                            Obx(() => isLogin.value ? const LoginFrom():const SignUpForm())
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
