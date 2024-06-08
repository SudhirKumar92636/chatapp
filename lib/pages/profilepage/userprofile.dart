import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authController.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  AuthController authController = AuthController();
  RxBool isEdit = false.obs;
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfile");
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context).colorScheme.background,
                                  maxRadius: 80,
                                  backgroundImage: NetworkImage(profileController.currentUser.value.profileImage ?? "assets/images/girls.png"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                  profileController.currentUser.value.name ?? "UsersName",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                  profileController.currentUser.value.email ?? "email",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ))
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.call, color: Color(0xff039c00)),
                                      SizedBox(width: 10),
                                      Text(
                                        "Call",
                                        style: TextStyle(color: Color(0xff039c00)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.videocam, color: Color(0xffFF9900)),
                                      SizedBox(width: 10),
                                      Text(
                                        "video",
                                        style: TextStyle(color: Color(0xffFF9900)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.chat, color: Color(0xff0057FF)),
                                      SizedBox(width: 10),
                                      Text(
                                        "chat",
                                        style: TextStyle(color: Color(0xff0057FF)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                authController.logOutUser();
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
