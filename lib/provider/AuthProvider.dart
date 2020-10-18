import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool signIn = true;

  bool get isSigningIn => signIn;

  change() {
    signIn = !signIn;
    notifyListeners();
  }
}
