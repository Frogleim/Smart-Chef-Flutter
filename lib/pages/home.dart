import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/pages/recieps.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _ingredientsContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Lottie.network(
                  'https://lottie.host/9cbcc044-e690-4e89-9afa-a784ba52859a/bNN0U1rw7l.json',
                  repeat: false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52, right: 150),
              child: Text(
                "Don't know what cook?",
                style: TextStyle(
                  fontFamily: "SF Pro Rounded",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                  height: 82 / 34,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _ingredientsContorller,
                decoration: InputDecoration(
                    hintText: 'Enter Ingredients',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade400))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  print("Clicked!");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Recieps(
                          ingredient: _ingredientsContorller.text.trim())));
                },
                fillColor: mainColor,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Get Recieps',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
