import 'package:chatapp/modles/chatmodles.dart';
import 'package:chatapp/modles/userModles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../pages/profilepage/profilController.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  static ProfileController controller = Get.put(ProfileController());
  static RxBool isLoading = false.obs;
  static Uuid uuid = const Uuid();

   getRoomId(String targetUserId) {
    isLoading.value = true;
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

   Future<void> sendMessage(String targetUserId,String message)async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    var newChats = ChartsModles(
      id: chatId,
      message: message,
      senderId:auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: controller.currentUser.value.name,
      timestamp: DateTime.now().toString()
    );
    // Changed uuid.v6() to uuid.v4() for better uniqueness

    try {
      print("Sender Name: ${controller.currentUser.value.name}");
    await  _db.collection("chats").doc(roomId).collection("messages").doc(chatId).set(
        newChats.toJson());
      print("Sender Name: ${controller.currentUser.value.id}");

    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Stream<List<ChartsModles>> getMessages(String targetUserId){
     String roomId = getRoomId(targetUserId);
     return _db.collection("chats").doc(roomId).collection("messages").orderBy("timestamp" ,descending: true).snapshots().
    map((snapshots) => snapshots.docs.map((doc) => ChartsModles.fromJson(doc.data())).toList());
  }




   getSender(UserModles currentUser ,UserModles targetUser){
     String currentUserId = currentUser.id!;
     String targetUserId = targetUser.id!;
     if(currentUserId[0].codeUnitAt(0)>targetUserId[0].codeUnitAt(0)){
       return currentUser;
     }else{
       targetUser;
     }}

   getReceiver(UserModles currentUser ,UserModles targetUser){
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if(currentUserId[0].codeUnitAt(0)>targetUserId[0].codeUnitAt(0)){
      return targetUser;
    }else{
      currentUser;
    }}

  // Future<void> sendMessage(String targetUserId,String message, UserModles targetUser,)async{
  //    isLoading.value = true;
  //    String chatId = uuid.v6();
  //    String roomId = getRoomId(targetUserId);
  //    DateTime timestamp = DateTime.now();
  //    String nowTime = DateFormat('h:mm a').format(timestamp);
  //    UserModles sender = getSender(controller.currentUser.value, targetUser);
  //    UserModles receiver = getReceiver(controller.currentUser.value, targetUser);
  //    var newChat = ChartsModles(
  //      id:chatId,
  //      message: message,
  //      senderId: auth.currentUser!.uid,
  //      receiverId: targetUserId,
  //      timestamp: DateTime.now().toString()
  //    );
  //
  //    var roomDetails = ChatRoomModles(
  //      id: roomId,
  //      lastMessage: message,
  //      lastMessageTimesatmp: nowTime,
  //      sender: sender,
  //      receiver: receiver,
  //      timestamp: DateTime.now().toString(),
  //      unReadMessNo: 0
  //
  //    );
  //    try{
  //
  //      await _db.collection("chats").doc(roomId).collection("messages").doc(chatId).set(newChat.toJson());
  //      await _db.collection("chats").doc(roomId).set(
  //          roomDetails.toJson());
  //    }catch(e){
  //      print(e);
  //    }
  // }
}
