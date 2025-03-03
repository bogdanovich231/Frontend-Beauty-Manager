import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String text;
  const CustomForm({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 63,
      child: TextFormField(
        style: TextStyle(fontSize: 18, color: Color(0xFF7B7B7B)),
        decoration: InputDecoration(
          labelText: text,
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
