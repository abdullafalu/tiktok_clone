import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/constant.dart';
import 'package:tiktok_clone/views/screens/auth/sign_up_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input_feild.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({
    super.key,
  });

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
                kHeight25,
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
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
                  onTap: () => authController.loginUser(
                      _emailController.text, _passwordController.text),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: buttonColor,
                    ),
                    child: const Center(
                        child: Text(
                      "Login Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ),
                kHeight25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: buttonColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
