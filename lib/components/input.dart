import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  Input({this.controller, this.label, this.hint, this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              icon: icon != null ? Icon(icon) : null)),
    );
  }
}
