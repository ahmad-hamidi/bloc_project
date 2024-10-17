import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final TextEditingController editTextController;

  const TextInput({required this.editTextController, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editTextController,
    );
  }
}
