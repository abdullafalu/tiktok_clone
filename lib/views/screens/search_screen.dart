import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/search_controller.dart';
import 'package:tiktok_clone/core/constant.dart';
import 'package:tiktok_clone/model/user.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';

class SeachScreen extends StatelessWidget {
  SeachScreen({super.key});

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: buttonColor,
          title: TextFormField(
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: fontColor,
                fontSize: 18,
              ),
            ),
            onFieldSubmitted: (value) => searchController.searchUsers(value),
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  "Search for users!",
                  style: TextStyle(
                      fontSize: 25,
                      color: fontColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid))),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.profilePhoto,
                        ),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          color: fontColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }),
      );
    });
  }
}
