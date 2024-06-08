import 'package:chatapp/modles/callmodles.dart';
import 'package:chatapp/modles/userModles.dart';
import 'package:chatapp/pages/callscreens/audiocallscreens.dart';
import 'package:chatapp/pages/callscreens/videocall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController{
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uuid = Uuid().v4();

  void onInit(){
    super.onInit();
     getNotificationsCall().listen((List<CallModles> calllist) {
       if(calllist.isNotEmpty){
         var callData = calllist[0];
       if(callData.type == "audio"){
         audioCallNoti(callData);
       }else if(callData.type == "video"){
         videoCallNoti(callData);
       }
       }
     });
  }

  Future<void>audioCallNoti(CallModles callData)async{
    Get.snackbar(
        duration: Duration(days: 1),
        barBlur: 0,
        backgroundColor: Colors.grey[900]!,
        isDismissible: false,
        icon: Icon(Icons.call),
        onTap: (snack) {
          Get.back();
          Get.to(AudioCallScreens(target: UserModles(
              id: callData.callerUid,
              name: callData.callerName,
              email: callData.callerEmail,
              profileImage: callData.callerPic
          )));
        },
        callData.callerName!, "Incoming Audio Call",mainButton: TextButton(
        onPressed: (){
          endCall(callData);
          Get.back();
        }, child: const Text("End Call")));
  }


  Future<void> call(UserModles receiver,UserModles caller , String type)async{
    String id = uuid;
    var newCall = CallModles(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: receiver.name,
      receiverEmail: receiver.email,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      status: "dialing",
      type: type

    );
    try{
      await db.collection("notifications").doc(receiver.id).collection("calls").
      doc(id).set(newCall.toJson());
      await db.collection("user").doc(auth.currentUser!.uid).collection("calls").doc(id).set(
        newCall.toJson()
      );

      await db.collection("user").doc(receiver.id).collection("calls").doc(id).set(
          newCall.toJson()
      );
      Future.delayed(Duration(seconds: 15),(){
        endCall(newCall);
      });
    }catch(e){
      print(e);
    }
  }


  Stream<List<CallModles>> getNotificationsCall(){
    return db.collection("notifications").doc(auth.currentUser!.uid).collection("calls").snapshots().map((snapshot) =>
    snapshot.docs.map((doc) =>CallModles.fromJson(doc.data())).toList());
  }
   Future<void> endCall(CallModles call)async{
    try{
      await db.collection("notifications").doc(call.receiverUid).collection("calls").doc(call.id).delete();
    }catch(e){
      print(e);
    }
   }

  void videoCallNoti(CallModles callData) {

    Get.snackbar(
        duration: Duration(days: 1),
        barBlur: 0,
        backgroundColor: Colors.grey[900]!,
        isDismissible: false,
        icon: Icon(Icons.video_call),
        onTap: (snack) {
          Get.back();
          Get.to(VideoCallScreens(target: UserModles(
              id: callData.callerUid,
              name: callData.callerName,
              email: callData.callerEmail,
              profileImage: callData.callerPic
          )));
        },
        callData.callerName!, "Incoming video Call",mainButton: TextButton(
        onPressed: (){
          endCall(callData);
          Get.back();
        }, child: const Text("End Call")));


  }


}