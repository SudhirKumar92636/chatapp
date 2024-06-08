import 'package:chatapp/Config/images.dart';
import 'package:chatapp/contactsPages/widgets/contactssearch.dart';
import 'package:chatapp/contactsPages/widgets/newcontactstile.dart';
import 'package:chatapp/controller/chatcontroller.dart';
import 'package:chatapp/controller/contactscontroller.dart';
import 'package:chatapp/pages/home/widgets/chatallusers.dart';
import 'package:chatapp/pages/home/widgets/chatscreens.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsPages extends StatefulWidget {
  const ContactsPages({super.key});

  @override
  State<ContactsPages> createState() => _ContactsPagesState();
}

class _ContactsPagesState extends State<ContactsPages> {
  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactsController contactsController = Get.put(ContactsController());
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts List"),
        actions: [
          Obx(() =>IconButton(onPressed: (){
            isSearchEnable.value =!isSearchEnable.value;
          }, icon: isSearchEnable.value ?const Icon(Icons.close):const Icon(Icons.search))
          )],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
           Obx(() =>  isSearchEnable.value ? const ContactsSearch() :const SizedBox(),),
           const SizedBox(height: 10,),
            NewContactsTile(btnName: 'New Contact', icon: Icons.person_add, ontap: () {  },),
            const SizedBox(height: 10,),
            NewContactsTile(btnName: 'New Group', icon: Icons.group_add, ontap: () {  },),
            const SizedBox(height: 10,),
            const Row(
              children: [
                Text("Contacts on Sam-park App")
              ],
            ),
            const SizedBox(height: 10,),
            Obx(() =>
                Column(
                    children: contactsController.userList.map((element) =>  InkWell(
                      onTap: () {
                        Get.to(ChatScreens(userModles: element));
                        String roomId = chatController.getRoomId(element.id!);
                        print("RoomId: --->${roomId}");
                       
                      },
                      child:  ChatTile(
                        imgUrl:element.profileImage ??AssetsImages.defaultImagesUrl,
                        name:element.name ?? "Username",

                        lastChat:element.about ?? "Hey There",
                        lastTime: element.email ==profileController.currentUser.value.email ? "You":"others",
                      ),
                    ),).toList()
                ))

          ],
        ),
      ),
    );
  }
}
