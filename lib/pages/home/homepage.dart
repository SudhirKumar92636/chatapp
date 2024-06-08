import 'package:chatapp/Config/strings.dart';
import 'package:chatapp/controller/contactscontroller.dart';
import 'package:chatapp/controller/imagecontroller.dart';
import 'package:chatapp/pages/home/widgets/chatlist.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> with TickerProviderStateMixin {
  ProfileController profileController = Get.put(ProfileController());
  ImageController imageController = Get.put(ImageController());
  ContactsController contactsController = Get.put(ContactsController());
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed("/contactsPage");
      },child: const Icon(Icons.add,color: Colors.blue,),),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(AppStrings.appName,style: Theme.of(context).textTheme.headlineSmall,),
        leading: const Icon(Icons.chat_outlined),
        actions: [
          IconButton(onPressed: (){
            contactsController.getChatRoomList();
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: ()async{
            await profileController.getUserDetails();
            Get.toNamed("/profileScreens");
          }, icon: const Icon(Icons.more_vert)),

        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: TabBar(
            controller:tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
              tabs: const [
            Text("Chats"),
            Text("Groups"),
            Text("Calls")
          ]),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: TabBarView(
            controller: tabController,
            children:  [
              const ChatList(),
              ListView(
                children: const [
                  ListTile(
                    title: Text("Sudhir kumar"),
                  )
                ],
              ),
              ListView(
                children: const [
                  ListTile(
                    title: Text("Sudhir kumar"),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}
