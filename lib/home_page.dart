// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ShahLand",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.lime[700],
      ),
      body: Container(
        color: Colors.lime[300],
        child: Lottie.asset("assets/icons/home.json",
            fit: BoxFit.contain, width: 450, height: 650),
      ),
    );
  }
}
