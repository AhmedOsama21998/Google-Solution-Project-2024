import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutProvider extends ChangeNotifier{
  void signOutProvider()async{
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}