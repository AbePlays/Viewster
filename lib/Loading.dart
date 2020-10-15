import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
