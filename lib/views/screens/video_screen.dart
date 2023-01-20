import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/video_controller.dart';
import 'package:tiktok_clone/core/constant.dart';
import 'package:tiktok_clone/views/screens/comment_screen.dart';

import '../widgets/circle_animation.dart';
import '../widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
   VideoScreen({super.key});
  final VideoController videoController= Get.put(VideoController());

  buidMusicAlbum(String protilePhoto) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration:  BoxDecoration(
              gradient:const LinearGradient(
                colors: [Colors.grey, fontColor],
              ),
              borderRadius: BorderRadius.circular(25)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(image: NetworkImage(protilePhoto),fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: fontColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child:  Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
         () {
          return PageView.builder(
              itemCount: videoController.videoList.length,
              controller: PageController(initialPage: 0, viewportFraction: 1),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final data=videoController.videoList[index];
                return Stack(
                  children: [
                     VideoPlayerItem(videoUrl:data.videoUrl),
                    Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        data.username,
                                        style:const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: fontColor,
                                        ),
                                      ),
                                      Text(
                                        data.caption,
                                        style:const TextStyle(
                                          fontSize: 15,
                                          color: fontColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                         const Icon(
                                            Icons.music_note,
                                            color: fontColor,
                                            size: 15,
                                          ),
                                          Text(
                                            data.songName,
                                            style:const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                margin: EdgeInsets.only(top: size.height / 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildProfile(data.profilePhoto),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () => videoController.likeVideo(data.id),
                                          child: Icon(
                                            Icons.favorite,
                                            size: 40,
                                            color:data.likes.contains(authController.user.uid)? Colors.red:fontColor,
                                          ),
                                        ),
                                        kHeight7,
                                         Text(
                                          data.likes.length.toString(),
                                          style:const TextStyle(
                                            fontSize: 18,
                                            color: fontColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CommentScreen(id:data.id) )),
                                            child: const Icon(
                                              Icons.comment,
                                              size: 40,
                                              color: fontColor,
                                            )),
                                        kHeight7,
                                         Text(
                                          data.commentCount.toString(),
                                          style:const TextStyle(
                                              fontSize: 18, color: fontColor),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.share,
                                            size: 40,
                                            color: fontColor,
                                          ),
                                        ),
                                        kHeight7,
                                        Text(
                                          data.shareCount.toString(),
                                           style:const TextStyle(
                                            fontSize: 18,
                                            color: fontColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    CircleAnimation(
                                        child: buidMusicAlbum(data.profilePhoto)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              });
        }
      ),
    );
  }
}
