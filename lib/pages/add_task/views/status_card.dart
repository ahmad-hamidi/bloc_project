import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final Color bgColor;

  const StatusCard({required this.title, required this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
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
