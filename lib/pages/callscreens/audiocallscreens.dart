import 'package:chatapp/Config/strings.dart';
import 'package:chatapp/controller/chatcontroller.dart';
import 'package:chatapp/modles/userModles.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallScreens extends StatefulWidget {
  final UserModles target;
  const AudioCallScreens({super.key , required this.target});

  @override
  State<AudioCallScreens> createState() => _AudioCallScreensState();
}

class _AudioCallScreensState extends State<AudioCallScreens> {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    var callId = chatController.getRoomId(widget.target.id!) ;
    return ZegoUIKitPrebuiltCall(
      appID: ZeoCloudConfig.appId, // your AppID,
      appSign: ZeoCloudConfig.appSign,
      userID:profileController.currentUser.value.id?? "root",
      userName:profileController.currentUser.value.name ?? "root",
      callID:callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}
