import 'package:flutter/material.dart';
import 'package:smart_chef/auth/registration_page.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/models/firebaseAuth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

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
                      height: 150,
                    ),
                    Center(
                      child: CircleAvatar(
                          radius: 50,
                          backgroundColor: whiteColor,
                          child: Image.asset(
                              'lib/images/Bella Olonje logo 111 1.png')),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            'Reset Password',
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
                fillColor: whiteColor,
                onPressed: () {
                  resetPassword(_emailController.text.trim());
                },
                child: SizedBox(
                  height: 60, // Set your desired height here
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                          height: 20 / 17,
                          fontWeight: FontWeight.w600,
                          color: mainColor,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Text(
                  'Create account',
                  style: TextStyle(
                      height: 20 / 17,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                      fontSize: 17),
                ),
              ))
        ],
      ),
    );
  }
}
