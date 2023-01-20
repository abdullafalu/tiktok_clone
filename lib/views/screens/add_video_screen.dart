import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfirmScreen(
                videoFile: File(video.path),
                videoPath: video.path,
              )));
    }
  }

  showOptionDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: Colors.grey,
        children: [
          DialogueBox(
            icon: Icons.image,
            title: "Gallery",
            onpressed: () => pickVideo(ImageSource.gallery, context),
          ),
          DialogueBox(
            icon: Icons.camera,
            title: "Camera",
            onpressed: () => pickVideo(ImageSource.camera, context),
          ),
          DialogueBox(
            icon: Icons.cancel,
            title: "Cancel",
            onpressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionDialogue(context),
          child: Container(
            color: Colors.red,
            height: 50,
            width: 180,
            child: const Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DialogueBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onpressed;
  const DialogueBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onpressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
