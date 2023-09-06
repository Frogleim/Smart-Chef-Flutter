import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(80),
            child: Text(
              "Delicious food for you",
              style: const TextStyle(
                fontFamily: "SF Pro Rounded",
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
                height: 82 / 34,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _ingredientsContorller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.black),
                  hintText: "Enter your ingredients"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () {
                print("Clicked!");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Recieps(
                        ingredient: _ingredientsContorller.text.trim())));
              },
              fillColor: Colors.black,
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
    );
  }
}
