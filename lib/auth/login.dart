import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_chef/auth/forgot_password.dart';
import 'package:smart_chef/auth/registration_page.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/models/firebaseAuth.dart';
import 'package:smart_chef/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 550,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(40.0), // Adjust the radius as needed
                      bottomRight:
                          Radius.circular(40.0), // Adjust the radius as needed
                    ),
                    color: Colors
                        .white // Set the background color of the container
                    ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: CircleAvatar(
                          radius: 80,
                          backgroundColor: whiteColor,
                          child: Lottie.network(
                              'https://lottie.host/bc01677e-04b4-41f6-b964-66d25e8f355f/582bMMLyyE.json',
                              repeat: false)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 300),
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                              fontFamily: "SF Pro Text",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                              height: 21 / 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              'Forgot passcode?',
                              style: TextStyle(
                                fontFamily: "SF Pro Text",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: mainColor,
                                height: 20 / 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          Positioned(
              bottom: 120,
              left: 50,
              right: 50,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                fillColor: Colors.white,
                onPressed: () {
                  Lottie.network(
                      'https://lottie.host/78b1e017-ab59-4cc1-b71d-99fc9a491dcb/CZec4kRg9T.json');
                  signIn(_emailController.text.trim(),
                          _passwordController.text.trim())
                      .then((value) => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home())));
                },
                child: const SizedBox(
                  height: 60, // Set your desired height here
                  child: Center(
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                          height: 20 / 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF460A),
                          fontSize: 17),
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: 80,
              right: 135,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text(
                  'Create account',
                  style: TextStyle(
                      height: 20 / 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ))
        ],
      ),
    );
  }
}
