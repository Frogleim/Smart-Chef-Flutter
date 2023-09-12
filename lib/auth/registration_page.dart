import 'package:flutter/material.dart';
import 'package:smart_chef/auth/login.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/models/firebaseAuth.dart';
import 'package:smart_chef/pages/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
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
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft:
                          Radius.circular(40.0), // Adjust the radius as needed
                      bottomRight:
                          Radius.circular(40.0), // Adjust the radius as needed
                    ),
                    color:
                        whiteColor // Set the background color of the container
                    ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, right: 300),
                      child: Center(
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: whiteColor,
                            child: Image.asset(
                                'lib/images/Bella Olonje logo 111 1.png')),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 200),
                          child: Text(
                            'Create account',
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
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            obscureText: true,
                            controller: _repasswordController,
                            decoration: InputDecoration(
                                hintText: 'Re Password',
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
                                  builder: (context) => const Login()));
                            },
                            child: Text(
                              'Have an account?',
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
                fillColor: whiteColor,
                onPressed: () {
                  signUp(_emailController.text.trim(),
                          _passwordController.text.trim())
                      .then((value) => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Home())));
                },
                child: SizedBox(
                  height: 60, // Set your desired height here
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          height: 20 / 17,
                          fontWeight: FontWeight.w600,
                          color: mainColor,
                          fontSize: 17),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
