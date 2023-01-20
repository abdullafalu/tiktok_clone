import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/screens/add_video_screen.dart';
import 'package:tiktok_clone/views/screens/message_screen.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';
import 'package:tiktok_clone/views/screens/search_screen.dart';
import 'package:tiktok_clone/views/screens/video_screen.dart';

// page changing
List pages = [
  VideoScreen(),
  SeachScreen(),
  const AddVideoScreen(),
  const MessageScreeen(),
  ProfileScreen(uid: authController.user.uid),
];
// colors
const scaffoldBackgroundColor = Colors.black;
const fontColor = Colors.white;
const kHeight25 = SizedBox(
  height: 25,
);
const kHeight10 = SizedBox(
  height: 10,
);
const kGreyColor = Color.fromARGB(255, 139, 135, 135);
const kheight5 = SizedBox(
  height: 5,
);
const buttonColor = Color.fromARGB(255, 221, 73, 247);
const userDefaultImage =
    "https://img.freepik.com/free-icon/user_318-790139.jpg?w=2000";
const kHeight7 = SizedBox(
  height: 7,
);

const kWidth15 = SizedBox(
  width: 15,
);

// firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

//controllers
var authController = AuthController.instance;
