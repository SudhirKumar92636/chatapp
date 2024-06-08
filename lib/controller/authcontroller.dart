import 'package:chatapp/modles/userModles.dart';
import 'package:chatapp/pages/profilepage/profilController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  ProfileController profileController = Get.put(ProfileController());
  final RxBool isLoading = false.obs;

  // Method to handle user logout
   logOutUser()  async{
     await auth.signOut();
     if(auth.currentUser == null){
       Get.offAllNamed("/authPage");
     }
  }

  // Method to handle user login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      // Signing in with email and password
      await auth.signInWithEmailAndPassword(
        email: email, password: password,).then((value){
        if(value.user != null){
          Get.offAllNamed("/homeScreens");
        }});
      print("Login successful");
      
      // Print success message
    } on FirebaseAuthException catch (ex) {
      // Handling specific Firebase Auth exceptions
      if (ex.code == "user-not-found") {
        print("No user found with that email");
      } else if (ex.code == "wrong-password") {
        print("Incorrect password");
      } else {
        print("An error occurred: ${ex.message}");
      }
    } catch (ex) {
      print("An error occurred: $ex");
    } finally {
      isLoading.value = false; // Set isLoading to false regardless of outcome
    }
  }

  // Method to handle user registration
  Future<void> createUser(String email, String password ,String name) async {
    isLoading.value = true;
    try {
      // Creating a user with email and password
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email,name ,password);
      print("Account created successfully");
      Get.offAllNamed("/homeScreens");
// Print success message
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        print("An error occurred: ${e.message}");
      }
    } catch (e) {
      print("An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void>initUser(String email ,String name ,String password)async{
    var newUser = UserModles(
      email: email,
      name: name,
      password: password,
      id: auth.currentUser!.uid
    );
    try{
      await db.collection("users").doc(auth.currentUser!.uid).set(newUser.toJson());

    }catch (ex){
      print("Error :${ex.toString()}");
    }
  }



}
