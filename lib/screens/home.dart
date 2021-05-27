import 'package:ajara_test/styleguides/colors.dart';
import 'package:flutter/material.dart';
import 'package:ajara_test/styleguides/colors.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Welcome home", style: TextStyle(color: primaryColor, fontSize: 24),),
      ),
    );
  }
}
