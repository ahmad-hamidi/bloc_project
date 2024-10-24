import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback deleteListener, editListener;

  const TaskCard({required this.text, required this.backgroundColor, required this.deleteListener, required this.editListener, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
          const Spacer(),
          IconButton(
            onPressed: editListener,
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: deleteListener,
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
