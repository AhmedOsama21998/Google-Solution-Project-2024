import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier{
  void resetPassword({required String email})async{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}