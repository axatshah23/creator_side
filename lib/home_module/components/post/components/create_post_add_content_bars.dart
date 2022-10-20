import 'package:flutter/material.dart';

class CreatePostAddContentBars extends StatefulWidget {
  const CreatePostAddContentBars(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);
  final IconData icon;
  final String label;
  final Function() onTap;

  @override
  State<CreatePostAddContentBars> createState() =>
      _CreatePostAddContentBarsState();
}

class _CreatePostAddContentBarsState extends State<CreatePostAddContentBars> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.2,
              color: Colors.grey[350]!,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(widget.icon),
            const SizedBox(width: 16.0),
            Text(
              widget.label,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
