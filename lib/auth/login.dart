import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_chef/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

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
      backgroundColor: Color(0xFFFF4B3A),
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
                      height: 100,
                    ),
                    Center(
                      child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                              'lib/images/Bella Olonje logo 111 1.png')),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 300),
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                              fontFamily: "SF Pro Text",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
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
                            onTap: () {},
                            child: const Text(
                              'Forgot passcode?',
                              style: TextStyle(
                                fontFamily: "SF Pro Text",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffa4a0c),
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
        ],
      ),
    );
  }
}
