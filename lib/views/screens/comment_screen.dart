import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/comment_controller.dart';
import 'package:tiktok_clone/core/constant.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({super.key,required this.id});
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController=Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child:Obx(
                   () {
                    return ListView.builder(
                        itemCount: commentController.comments.length,
                        itemBuilder: (context, index) {
                          final comment=commentController.comments[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: scaffoldBackgroundColor,
                              backgroundImage: NetworkImage(comment.profilePhoto),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  '${comment.username}  ',
                                  style:const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  comment.comment,
                                  style:const TextStyle(
                                    color: fontColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  tago.format(comment.datePublished.toDate()),
                                  style:const TextStyle(
                                    fontSize: 12,
                                    color: fontColor,
                                  ),
                                ),
                               const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${comment.likes.length} likes",
                                  style:const TextStyle(
                                    color: fontColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: InkWell(
                              onTap:() => commentController.likeComment(comment.id),
                              child: Icon(
                                Icons.favorite,
                                size: 25,
                                color: comment.likes.contains(authController.user.uid)? Colors.red:fontColor,
                              ),
                            ),
                          );
                        });
                  }
                ),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: fontColor,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Comment",
                    labelStyle: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => commentController.postComment(_commentController.text),
                  child:const Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 16,
                      color: fontColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
