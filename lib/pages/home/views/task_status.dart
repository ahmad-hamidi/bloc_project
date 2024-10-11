import 'package:flutter/material.dart';

class TaskStatus extends StatelessWidget {
  final String title;
  final Color bgColor;
  final VoidCallback clickListener;

  const TaskStatus(
      {required this.title,
      required this.bgColor,
      required this.clickListener,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: clickListener,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }
}
