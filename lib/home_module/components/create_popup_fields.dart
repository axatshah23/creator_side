import 'package:flutter/material.dart';

class CreatePopUpFields extends StatefulWidget {
  const CreatePopUpFields({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  State<CreatePopUpFields> createState() => _CreatePopUpFieldsState();
}

class _CreatePopUpFieldsState extends State<CreatePopUpFields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.black,
        ),
        const SizedBox(width: 6.0),
        Text(widget.label),
      ],
    );
  }
}
