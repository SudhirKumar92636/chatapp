import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/controller/authcontroller.dart';
import 'package:chatapp/controller/imagecontroller.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImageController imageController = Get.put(ImageController());
  RxString imagePath= "".obs;

  @override
  Widget build(BuildContext context) {
    RxBool isEdit= false.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController nameController = TextEditingController(text:profileController.currentUser.value.name);
    TextEditingController emailController = TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phoneController = TextEditingController(text:profileController.currentUser.value.phoneNumber);
    TextEditingController aboutController = TextEditingController(text: profileController.currentUser.value.about);

    AuthController authController = Get.put(AuthController());


    return Obx(()=>
       Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
               IconButton(onPressed: (){
                  authController.logOutUser();
                }, icon:const Icon(Icons.logout)),


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
                          color: Theme.of(context).colorScheme.primaryContainer
                        ),
                        child:  Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [Obx(() => isEdit.value?InkWell(
                                          onTap: ()async {
                                          imagePath.value =await  imageController.pickImage();
                                          },
                                          child:
                                          Container(
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.background,
                                              borderRadius: BorderRadius.circular(100),),
                                            child: imagePath.value == "" ?const Icon(Icons.add):ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: Image.file(File(imagePath.value),
                                                fit: BoxFit.cover,),),
                                          )
                                        ) : Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.background,
                                            borderRadius: BorderRadius.circular(100),

                                          ),
                                          child: profileController.currentUser.value.profileImage == "" || profileController.currentUser.value.profileImage == null ?const Icon(Icons.image):ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: CachedNetworkImage(
                                                imageUrl:profileController.currentUser.value.profileImage! ,
                                                fit: BoxFit.cover,
                                                 placeholder: (context, url) =>
                                                   const CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                 ),



                                        ),))
                                        ],

                                      ),
                                  const SizedBox(height: 20,),
                                 Obx(() =>  TextFormField(
                                   controller: nameController,
                                   enabled: isEdit.value,
                                   decoration: InputDecoration(
                                       hintText: 'Name',
                                       filled: isEdit.value,
                                       labelText: 'name',
                                       prefixIcon: const Icon(Icons.person)
                                   ),
                                 ),),

                                  Obx(() => TextFormField(
                                    controller: aboutController,
                                    enabled: isEdit.value,
                                    decoration: InputDecoration(
                                        hintText: 'About',
                                        filled: isEdit.value,
                                        labelText: 'about',
                                        prefixIcon: const Icon(Icons.info)
                                    ),
                                  ),
                                  ),
                                   TextFormField(
                                    controller: emailController,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        hintText: 'email',
                                        filled: isEdit.value,
                                        labelText: 'email',
                                        prefixIcon: const Icon(Icons.alternate_email)
                                    ),
                                  ),

                                 Obx(() =>  TextFormField(
                                   controller: phoneController,
                                   enabled: isEdit.value,
                                   decoration: InputDecoration(
                                       hintText: 'phone number',
                                       filled: isEdit.value,
                                       labelText: 'phone',
                                       prefixIcon: const Icon(Icons.call)
                                   ),
                                 ),),
                                  const SizedBox(height: 20,),
                                 profileController.isLoading.value ?const CircularProgressIndicator():
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Obx(() =>   isEdit.value ? ElevatedButton.icon(
                                       onPressed: () {
                                         isEdit.value =false;
                                         profileController.updateProfile(imagePath.value ,nameController.text,aboutController.text,phoneController.text);

                                       },
                                       icon: const Icon(Icons.edit), // Specify the icon you want to use
                                       label: const Text("Save"),    // Specify the label text
                                       style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.blue,
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10),
                                         ),
                                       ),
                                     ): ElevatedButton.icon(
                                       onPressed: () {
                                         // Add your onPressed logic here
                                         isEdit.value = true;
                                       },
                                       icon: const Icon(Icons.edit), // Specify the icon you want to use
                                       label: const Text("Edit"),    // Specify the label text
                                       style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.blue,
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10),
                                         ),
                                       ),
                                     ),
                                     ),
                                   ],
                                 ),
                               const SizedBox(height: 20,),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}