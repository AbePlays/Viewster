import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 110,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Hi, Abe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Change Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Change Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("App Settings",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Help and Support",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign out",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
            textColor: Colors.white,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
