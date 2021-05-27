import 'package:ajara_test/styleguides/colors.dart';
import 'package:ajara_test/utils/image_assets.dart';
import 'package:flutter/material.dart';

class BackgroundHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height,
          color: primaryColor,
        ),
        Positioned(
          right: 10.0,
          child: Image.asset(backImage, height: 230.0,),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(logo),
              Text(
                'Create an Account',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
