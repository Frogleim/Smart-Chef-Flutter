import 'package:flutter/material.dart';
import 'package:smart_chef/auth/login.dart';
import 'package:smart_chef/models/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Stack(
          children: [
            Positioned(
              top: 70,
              left: 40,
              child: CircleAvatar(
                radius: 35,
                child: Image.asset('lib/images/Bella Olonje logo 111 1.png'),
              ),
            ),
            Positioned(
              top: 175,
              left: 40,
              child: Text(
                "Welcome\nto SmartChef",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                    fontFamily: "SF Pro Rounded"),
              ),
            ),
            Positioned(
                bottom: 100,
                right: 20,
                child: Image.asset('lib/images/ToyFaces_Tansparent_BG_29.png')),
            Positioned(
                bottom: 80,
                left: 20,
                child: Image.asset(
                  'lib/images/ToyFaces_Tansparent_BG_49.png',
                  height: 420,
                )),
            Positioned(
                bottom: 0,
                right: 10,
                child: Image.asset('lib/images/Rectangle 5.png')),
            Positioned(
                bottom: 0,
                left: 10,
                child: Image.asset('lib/images/Rectangle 3.png')),
            Positioned(
                bottom: 40,
                left: 50,
                right: 50,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  fillColor: whiteColor,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: SizedBox(
                    height: 50, // Set your desired height here
                    child: Center(
                      child: Text(
                        'Get Starteed',
                        style: TextStyle(
                            height: 20 / 17,
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
