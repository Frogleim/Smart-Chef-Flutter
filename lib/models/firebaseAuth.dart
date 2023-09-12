import 'package:firebase_auth/firebase_auth.dart';

Future<void> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
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
