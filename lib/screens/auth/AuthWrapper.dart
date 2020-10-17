import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/AuthProvider.dart';
import 'package:viewster/screens/auth/Signin.dart';
import 'package:viewster/screens/auth/Signup.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        if (auth.isSignedIn == true) {
          return Signin();
        } else {
          return Signup();
        }
      },
    );
  }
}
