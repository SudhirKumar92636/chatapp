import 'package:chatapp/modles/chat_room_modles.dart';
import 'package:chatapp/modles/userModles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController{
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModles> userList = <UserModles>[].obs;
  RxList<ChatRoomModles> chatRoomList = <ChatRoomModles>[].obs;

  void onInit()async{
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }


  Future<void> getUserList() async {
    isLoading.value = true;
    try{userList.clear();
      await db.collection("users").get().then((value) {
        userList.value = value.docs.map((e) => UserModles.fromJson(e.data())).toList();
      });
    }catch(ex){
      print(ex.toString());
    }
    isLoading.value = false;
  }

  // get only cheating users this funcations

   Future<void> getChatRoomList()async{
    List<ChatRoomModles> chatRoomList =[];
     await db.collection("chats").get().then((value){
       chatRoomList = value.docs.map((e) => ChatRoomModles.fromJson(e.data())).toList();
     });

     print(chatRoomList);

   }


}