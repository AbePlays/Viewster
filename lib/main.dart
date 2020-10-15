import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viewster/screens/BottomNavigator/BottomNavigator.dart';
import 'package:viewster/screens/auth/Signin.dart';
import 'package:viewster/screens/auth/Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  void checkUser() {
    auth.authStateChanges().listen((User user) {
      setState(() {
        checking = false;
      });
      if (user == null) {
        print("Nope");
        setState(() {
          userFound = false;
        });
      } else {
        print("Yep");
        userFound = true;
      }
    });
  }

  bool checking = true;
  bool userFound = false;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: checking
            ? Text("Hello")
            : userFound ? BottomNavigator() : Signin());
  }
}
