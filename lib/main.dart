import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_chef/auth/checkLogin.dart';
import 'package:smart_chef/auth/login.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: const CheckLogin(),
    );
  }
}
