import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 15.0);
  TextStyle linkStyle = TextStyle(color: Colors.orange);

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
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
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
                onPressed: () {},
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 15),
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
                      recognizer: TapGestureRecognizer()..onTap = () {},
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