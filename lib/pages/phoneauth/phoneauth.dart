import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'phoneauthcontroller.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  PhoneController phoneController  = Get.put(PhoneController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Image.asset("assets/images/boy.png"),
           IntlPhoneField(
             controller: phoneController.numberController,
             decoration: const InputDecoration(
               labelText: 'Enter Phone Number',
               border: OutlineInputBorder(
                 borderSide: BorderSide()
               )
             ),

           ),
          ElevatedButton(onPressed: (){
            phoneController.singUpWithNumber();
          }, child: const Text("Phone Auth"))
        ],
      ),
    );
  }
}