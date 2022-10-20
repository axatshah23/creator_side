import 'package:flutter/material.dart';

class DropDownChild extends StatefulWidget {
  const DropDownChild({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  State<DropDownChild> createState() => _DropDownChildState();
}

class _DropDownChildState extends State<DropDownChild> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          widget.icon,
          color: Colors.grey,
          size: 18.0,
        ),
        const SizedBox(width: 10.0),
        Text(widget.label),
      ],
    );
  }
}
