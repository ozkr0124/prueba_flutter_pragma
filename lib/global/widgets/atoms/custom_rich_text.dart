import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  
  final String title;
  final String text;
  final double? fontSize;

  const CustomRichText({
    required this.title,
    required this.text,
    this.fontSize = 16.0,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: fontSize
            ),
          ),
        ],
      ),
    );
  }
}
