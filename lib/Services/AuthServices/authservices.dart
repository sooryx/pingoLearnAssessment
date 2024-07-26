import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/Widgets/customtoasts.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailPassword(
      {required BuildContext context, required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
     await customSuccessToast(context,"Login Success");
     await Navigator.pushNamed(context, "/homescreen");
      return result.user;
    } catch (e) {
      await customErrorToast(context, "Login Failed! ${e.toString()}");
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmailPassword(
      {required BuildContext context,required String name, required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'user_name': name,
        'user_email': email,
      });
      await customSuccessToast(context, "Registered Successfully");
      return user;
    } catch (e) {
      await customErrorToast(context, "Registeratio failed !");

      print(e.toString());
      return null;
    }
  }
}
