import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  // !register
  Future<void> register(
      BuildContext context, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }

  // ! login
  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(e.toString()),
                actions: [
                  TextButton(onPressed: () {}, child: const Text("Ok"))
                ],
              ));
    }
  }

  // ! forgot password

  // ! auth state changes
  Stream<User?> get authStateChange => auth.authStateChanges();
}
