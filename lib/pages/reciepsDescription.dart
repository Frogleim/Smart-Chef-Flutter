import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String recUrl;
  const Description({super.key, required this.recUrl});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    print(widget.recUrl);
    return Scaffold();
  }
}
