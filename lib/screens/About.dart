import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'About KLiK',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            )),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "This simple app is build with a Flutter front-end and AWS Serverless back-end.")),
      ],
    );
  }
}