import 'package:chatapp/pages/phoneauth/otpscreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController numberController = TextEditingController();
  String verifyId ="";




  void singUpWithNumber()async{
    try{
      await auth.verifyPhoneNumber(
          phoneNumber: "+91${numberController.text}",
          verificationCompleted: (PhoneAuthCredential credential){
            print(credential);
          },
          verificationFailed:(FirebaseAuthException exception) {
            print(exception);
          },
          codeSent: ( String verificationId, int? resendToken) {
            verifyId = verificationId;
            Get.to(OtpScreens());
          },
          codeAutoRetrievalTimeout: (String verificationId){

          });

  }catch(ex){
         print(ex);
}
}}