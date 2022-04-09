import 'package:chat_app/components/messenger_comp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUpWithMail(
      BuildContext context, String name, String email, String password) async {
    try {
      await _firestore.collection("users").doc(email).set(
        {
          "name": name,
          "emal": email,
          "password": password,
          "joinTime": FieldValue.serverTimestamp(),
        },
      );

      await _authUser.createUserWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MessengerComp.messenger(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        MessengerComp.messenger(
            context, "The account already exists for that email.");
      }
    }
  }

  Future signInWithMail(
      BuildContext context, String email, String password) async {
    try {
      await _authUser.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MessengerComp.messenger(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        MessengerComp.messenger(
            context, "Wrong password provided for that user.");
      }
    }
  }

  Future signOut(BuildContext context) async {
    await _authUser.signOut();
    Navigator.pushNamedAndRemoveUntil(context, "/splash", (route) => false);
  }
}
