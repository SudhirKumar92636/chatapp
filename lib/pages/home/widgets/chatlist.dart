import 'package:chatapp/Config/images.dart';
import 'package:chatapp/controller/contactscontroller.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatallusers.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  ContactsController contactsController = Get.put(ContactsController());
  ProfileController profileController= Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
        children:contactsController.chatRoomList.map((element) => InkWell(
          onTap: (){
            Get.toNamed("/chatScreens");
          },
          child: const ChatTile(
            imgUrl: AssetsImages.defaultImagesUrl,
            name: "Khurshid",
            lastChat: "Bad me bat Karate hai",
            lastTime: "08:36pm",
          ),
        ), ).toList()));

  }
}
