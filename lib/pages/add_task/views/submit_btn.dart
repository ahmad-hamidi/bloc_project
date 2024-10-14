import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  final VoidCallback clickListener;

  const SubmitButton({super.key, required this.clickListener});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: clickListener,
        child: Container(
          width: 150,
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Add new todo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
