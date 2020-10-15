import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viewster/screens/BottomNavigator/BottomNavigator.dart';
import 'package:viewster/screens/auth/Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signup(),
    );
  }
}
