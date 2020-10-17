import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/AuthProvider.dart';
import 'package:viewster/provider/UserInfoProvider.dart';
import 'package:viewster/screens/BottomNavigator/BottomNavigator.dart';
import 'package:viewster/screens/auth/AuthWrapper.dart';
import 'package:viewster/Loading.dart';

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
        setState(() {
          userFound = true;
        });
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
    return ChangeNotifierProvider(
      create: (context) => UserInfoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: checking
            ? Loading()
            : userFound
                ? BottomNavigator()
                : ChangeNotifierProvider(
                    create: (context) => AuthProvider(),
                    child: AuthWrapper(),
                  ),
      ),
    );
  }
}
