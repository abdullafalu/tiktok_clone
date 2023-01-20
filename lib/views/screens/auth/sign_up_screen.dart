import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';

import '../../../core/constant.dart';
import '../../widgets/text_input_feild.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  kHeight25,
                  const Text(
                    "Tiktok Clone",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2),
                  ),
                  kHeight25,
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: Image.network(userDefaultImage),
                      ),
                      Positioned(
                        bottom: -15,
                        right: -13,
                        child: IconButton(
                          onPressed: () => authController.pickImage(),
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: fontColor,
                            size: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kheight5,
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight25,
                  Container(
                    child: TextInputFeild(
                      controller: _usernameController,
                      icon: Icons.account_box,
                      labelText: "Username",
                    ),
                  ),
                  kHeight25,
                  Container(
                    child: TextInputFeild(
                      controller: _emailController,
                      icon: Icons.email,
                      labelText: 'Email',
                    ),
                  ),
                  kHeight25,
                  Container(
                    child: TextInputFeild(
                      controller: _passwordController,
                      icon: Icons.lock,
                      labelText: "Password",
                    obscure: true,
                    
                    ),
                  ),
                  kHeight25,
                  InkWell(
                    onTap: () => authController.registerUser(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: buttonColor,
                      ),
                      child: const Center(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  kHeight25,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ));
                          },
                          child: const Text(
                            "Login Now",
                            style: TextStyle(color: buttonColor, fontSize: 18),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
