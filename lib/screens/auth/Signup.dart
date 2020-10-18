import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;
import 'package:viewster/provider/AuthProvider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 15.0);
  TextStyle linkStyle = TextStyle(color: Colors.orange);

  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  void signup() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid && name.isNotEmpty) {
      if (password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          password.trim().length >= 6 &&
          confirmPassword.trim().length >= 6 &&
          password == confirmPassword) {
        print(email + " " + password + " " + confirmPassword);
        FirebaseFunctions.signUp(email, password, name);
        return;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text("Wrong Credentials"),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create Your Account ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sign up and get started',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image(
                image: AssetImage('assets/images/signup.png'),
                height: 300,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.orange,
                ),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.code,
                  color: Colors.orange,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  confirmPassword = val;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.code,
                  color: Colors.orange,
                ),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                onPressed: signup,
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: defaultStyle,
                  children: <TextSpan>[
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: 'Log in',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .change();
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
