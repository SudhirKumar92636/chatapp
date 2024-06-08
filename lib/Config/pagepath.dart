import 'package:chatapp/contactsPages/contactspage.dart';
import 'package:chatapp/modles/userModles.dart';
import 'package:chatapp/pages/auth/authpage.dart';
import 'package:chatapp/pages/profilepage/profilepage.dart';
import 'package:chatapp/pages/profilepage/userprofile.dart';
import 'package:chatapp/pages/profilepage/updateprofile.dart';
import 'package:get/get.dart';
import '../pages/home/widgets/chatscreens.dart';
import '../pages/home/homepage.dart';

var pagePath =[
  GetPage(name: "/authPage",
    page: ()=>const AuthPage(),
  transition:Transition.rightToLeft,
  ),
  GetPage(name: "/homeScreens",
    page: ()=>const HomeScreens(),
    transition:Transition.leftToRight,
  ),
  // GetPage(name: "/chatScreens",
  //   page: ()=> ChatScreens(),
  //   transition:Transition.leftToRight,
  // ),

   GetPage(name: "/profileScreens",
    page: ()=>const ProfilePage(),
    transition:Transition.leftToRight,
  ),
  GetPage(name: "/updateProfile",
    page: ()=>const UpdateProfile(),
    transition:Transition.leftToRight,
  ),
  GetPage(name: "/userInfo", page: () =>  UserProfile(),
  transition: Transition.leftToRight),
  GetPage(name:"/contactsPage" , page:() => const ContactsPages(),
  transition: Transition.leftToRight)
];