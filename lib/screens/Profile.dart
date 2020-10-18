import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;
import 'package:viewster/provider/UserInfoProvider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void signout() {
    FirebaseFunctions.signout();
  }

  @override
  Widget build(BuildContext context) {
    String name =
        Provider.of<UserInfoProvider>(context, listen: false).userName;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
              "Hi, $name",
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
            onPressed: signout,
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
