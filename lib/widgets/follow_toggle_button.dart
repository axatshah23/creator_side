import 'package:flutter/material.dart';

import '../constants.dart';

class FollowToggleButton extends StatefulWidget {
  const FollowToggleButton({Key? key}) : super(key: key);

  @override
  State<FollowToggleButton> createState() => _FollowToggleButtonState();
}

class _FollowToggleButtonState extends State<FollowToggleButton> {
  String label = 'Follow';
  Color containerBackgroundColor = Colors.white;
  Color labelTextColor = kPinkColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: handle event for follow and unfollow of an account
        setState(() {
          if (label == 'Follow') {
            label = 'Following';
            containerBackgroundColor = kPinkColor;
            labelTextColor = Colors.white;
          } else {
            label = 'Follow';
            containerBackgroundColor = Colors.white;
            labelTextColor = kPinkColor;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: kPinkColor),
          color: containerBackgroundColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: labelTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
