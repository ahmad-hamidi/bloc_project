import 'package:flutter/material.dart';

class TaskStatus extends StatelessWidget {
  final String title;
  final Color bgColor;

  const TaskStatus({required this.title, required this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
