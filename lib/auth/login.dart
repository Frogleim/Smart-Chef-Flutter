import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 237, 237),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 450,
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
                    Row(
                      children: [],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
