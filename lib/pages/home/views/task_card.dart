import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text;

  const TaskCard({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Text(text),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
