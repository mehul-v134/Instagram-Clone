import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color bgColor;
  final Color bColor;
  final Color textColor;
  final String text;
  final double width;
  const FollowButton(
      {Key? key,
      required this.bColor,
      required this.bgColor,
      required this.text,
      required this.textColor,
      required this.width,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextButton(
          onPressed: function,
          child: Container(
            alignment: Alignment.center,
            height: 35,
            decoration: BoxDecoration(
                // color: bgColor,
                gradient: LinearGradient(colors: [bgColor, bColor]),
                // border: Border.all(color: bColor),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontFamily: "Roboto"),
            ),
          ),
        ),
      ),
    );
  }
}
