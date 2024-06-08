//
//
// import 'dart:io';
//
// import 'package:chatapp/modles/userModles.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
//
// class ProfileController extends GetxController{
//
//
//   final auth = FirebaseAuth.instance;
//   final db = FirebaseFirestore.instance;
//   final store = FirebaseStorage.instance;
//   Rx<UserModles> currentUser = UserModles().obs;
//   RxBool isLoading = false.obs;
//
//
//
//
//   void onInit()async{
//     super.onInit();
//     await getUserDetails();
//   }
//   Future<void> getUserDetails() async{
//     await db.collection("users").doc(auth.currentUser!.uid).get().then((value) => {
//       currentUser.value =UserModles.fromJson(value.data()!)
//     });
//   }
//
//   Future<void> updateProfile(
//       String imageUrl,
//       String name,
//       String about,
//       String number) async {
//     isLoading.value = true;
//     try {
//       if (imageUrl != "") {
//         final imageLink = await uploadFileToFirebase(imageUrl);
//         if (imageLink.isNotEmpty) {
//           final updateUsers = UserModles(
//               name: name,
//               about: about,
//               profileImage: imageLink,
//               phoneNumber: number
//           );
//           await db.collection("users").doc(auth.currentUser!.uid).set(
//             updateUsers.toJson(),
//           );
//         } else {
//           // Handle case when image upload fails
//           throw Exception("Image upload failed");
//         }
//       } else {
//         final updateUsers = UserModles(
//             name: name,
//             about: about,
//             profileImage: "", // Assuming no image update
//             phoneNumber: number
//         );
//         await db.collection("users").doc(auth.currentUser!.uid).set(
//           updateUsers.toJson(),
//         );
//       }
//     } catch (ex) {
//       print(ex);
//     }
//     isLoading.value = false;
//   }
//
//   Future<String> uploadFileToFirebase(String imagePath) async {
//     final path = "files/${imagePath}";
//     final file = File(imagePath);
//     if (imagePath != "") {
//       try {
//         final ref = FirebaseStorage.instance.ref().child(path); // Corrected path
//         await ref.putFile(file);
//         final downloadImageUrl = await ref.getDownloadURL();
//         print(downloadImageUrl);
//         return downloadImageUrl;
//       } catch (ex) {
//         print(ex);
//         return ""; // Return empty string if upload fails
//       }
//     }
//     return ""; // Return empty string if imagePath is empty
//   }
//
// }
//
//
//
//


import 'dart:io';

import 'package:chatapp/modles/userModles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final  _auth = FirebaseAuth.instance;
  final  _db = FirebaseFirestore.instance;
  final FirebaseStorage _store = FirebaseStorage.instance;

  Rx<UserModles> currentUser = UserModles().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await _db.collection("users").doc(_auth.currentUser!.uid).get().then((value) => {
      currentUser.value = UserModles.fromJson(value.data()!)
    });
  }

  Future<void> updateProfile(
      String imageUrl,
      String name,
      String about,
      String number,
      ) async {
    isLoading.value = true;
    try {
      String? imageLink = currentUser.value.profileImage; // Initialize with existing image URL
      if (imageUrl.isNotEmpty) {
        // Upload new image if provided
        imageLink = await uploadFileToFirebase(imageUrl);
      }

      final updatedUser = UserModles(
        id: _auth.currentUser!.uid,
        email: _auth.currentUser!.email, // Retain the existing email value
        name: name,
        about: about,
        phoneNumber: number,
        profileImage: imageLink,
      );

      await _db.collection("users").doc(_auth.currentUser!.uid).set(updatedUser.toJson());
      await getUserDetails(); // Fetch updated user data

      isLoading.value = false;
    } catch (ex) {
      print(ex);
      isLoading.value = false;
    }
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/${_auth.currentUser!.email}_${imagePath.split('/').last}";
    final file = File(imagePath);

    try {
      final ref = _store.ref().child(path);
      await ref.putFile(file);
      final downloadImageUrl = await ref.getDownloadURL();
      return downloadImageUrl;
    } catch (ex) {
      print(ex);
      return ""; // Return empty string if upload fails
    }
  }
}
