import 'package:chatapp/modles/userModles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbController extends GetxController{
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
    RxBool isLoading = false.obs;





 void onInit()async{
   super.onInit();
 await getUserList();

 }


  RxList<UserModles> userList = <UserModles>[].obs;

  Future<void> getUserList() async {
    isLoading.value = true;
   try{
     await db.collection("users").get().then((value) {
       userList.value = value.docs.map((e) => UserModles.fromJson(e.data())).toList();
     });
   }catch(ex){
     print(ex.toString());
   }
    isLoading.value = false;
  }


}