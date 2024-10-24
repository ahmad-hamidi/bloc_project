import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  final VoidCallback clickListener;
  final String textButton;

  const SubmitButton({super.key, required this.clickListener, required this.textButton});

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
          child: Center(
            child: Text(
              textButton,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
