import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String uid = "";
  UserModel(String uid) {
    this.uid = uid;
  }
}
