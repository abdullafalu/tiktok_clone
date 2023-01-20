import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/upload_video_controller.dart';
import 'package:tiktok_clone/core/constant.dart';
import 'package:tiktok_clone/views/widgets/text_input_feild.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  ConfirmScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });
  final File videoFile;
  final String videoPath;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController  _songController = TextEditingController();
  TextEditingController  _captionController = TextEditingController();

  UploadVideoController uploadVideoController= Get.put(UploadVideoController());
  @override 
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          kHeight25,
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.2,
            child: VideoPlayer(controller),
          ),
          kHeight25,
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputFeild(
                    controller: _songController,
                    icon: Icons.music_note,
                    labelText: "Song Name",
                  ),
                ),
                kHeight10,
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputFeild(
                    controller: _captionController,
                    icon: Icons.closed_caption,
                    labelText: "Caption",
                  ),
                ),
                kHeight10,
                ElevatedButton(
                  onPressed: () => uploadVideoController.uploadVideo(
                    _songController.text,
                    _captionController.text,
                    widget.videoPath,
                  ),
                  child: const Text(
                    "Share!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: fontColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
