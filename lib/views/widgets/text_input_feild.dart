import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/constant.dart';

class TextInputFeild extends StatelessWidget {
  const TextInputFeild(
      {super.key,
      required this.controller,
      this.obscure = false,
      required this.icon,
      required this.labelText});

  final TextEditingController controller;
  final bool obscure;
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      style:const TextStyle(color: fontColor, fontSize: 20),
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:const TextStyle(color: kGreyColor, fontSize: 20),
        prefixIcon: Icon(
          icon,
          color: fontColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGreyColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGreyColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(
            color: kGreyColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
