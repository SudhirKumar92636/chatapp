import 'package:chatapp/controller/chatcontroller.dart';
import 'package:chatapp/pages/callscreens/audiocallscreens.dart';
import 'package:chatapp/pages/callscreens/videocall.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/callcontroller.dart';
import '../../../modles/chatmodles.dart';
import '../../../modles/userModles.dart';
import '../../chat/widgets/chatBubble.dart';
import '../../profilepage/userprofile.dart';

class ChatScreens extends StatefulWidget {
   final UserModles userModles;
   const ChatScreens({Key? key,required this.userModles }) : super(key: key);

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  ChatController chatController = Get.put(ChatController());
  ProfileController profileController = Get.put(ProfileController());
  TextEditingController messageController = TextEditingController();
  CallController callController = Get.put(CallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.to(const UserProfile());
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(backgroundImage: AssetImage("assets/images/girls.png")),),),
        title: InkWell(
          onTap: () {
            Get.to(const UserProfile());
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.userModles.name?? "UserName", style: Theme.of(context).textTheme.bodyLarge),
                  Text("online", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Get.to(AudioCallScreens(target:widget.userModles));

            callController.call(widget.userModles, profileController.currentUser.value,"audio");
          }, icon: const Icon(Icons.call)),
          IconButton(onPressed: (){

            Get.to(VideoCallScreens(target:widget.userModles));

            callController.call(widget.userModles, profileController.currentUser.value,"audio");

          }, icon: const Icon(Icons.videocam)),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(

        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            const Icon(Icons.mic,size: 25,),
            const SizedBox(width: 10,),
             Expanded(
               child: TextField(
                 controller: messageController,
              decoration: const InputDecoration(
                filled: false,
                hintText: "Type Your message....."
              ),
            ),),
            const SizedBox(width: 10,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.image,size: 25,)),
            const SizedBox(width: 10,),
            IconButton(onPressed: (){
              if(messageController.text.isNotEmpty){
                 chatController.sendMessage(widget.userModles.id!, messageController.text.toString());
                 messageController.clear();
              }
            }, icon: const Icon(Icons.send,size: 25,))
          ],
        ),
      ),
     body:  Padding(padding: const EdgeInsets.only(bottom: 100,top: 15,left: 15,right: 15),
     child:StreamBuilder<List<ChartsModles>>(
    stream: chatController.getMessages(widget.userModles.id!),
    builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(
        child: CircularProgressIndicator(),
        );
    }
      else if(snapshot.hasError){
        return Center(child: Text("Error :---${snapshot.hasError.toString()}"),);
      }
      else if(snapshot.hasData) {
        return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.length,
            itemBuilder:(context, index) {
               DateTime timestamp = DateTime.parse(snapshot.data![index].timestamp!);
               String formattedTime = DateFormat('h:mm a').format(timestamp);
              return ChatBubbleScreens(
              message: snapshot.data![index].message!,
              imagesUrl: snapshot.data![index].imageUrl ?? "",
              isComming: snapshot.data![index].senderId!= profileController.currentUser.value.id,
                status: "true",
                time:formattedTime,
              );
            }, );
      }
      else{
        return const Center(child: Text("No Data Found"),);
      }

      },
    ))
    );
  }
}
