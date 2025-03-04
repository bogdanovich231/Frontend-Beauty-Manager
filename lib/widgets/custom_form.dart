import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String text;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  const CustomForm({
    super.key,
    required this.text,
    required this.validator,
    required this.onSaved,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 63,
          child: TextFormField(
            validator: (value) {
              String? error = widget.validator(value);
              setState(() {
                _errorMessage = error;
              });
              return null;
            },
            onSaved: widget.onSaved,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              labelText: widget.text,
              labelStyle: TextStyle(
                color: _errorMessage != null ? Colors.red : Color(0xFF7B7B7B),
              ),
              filled: true,
              fillColor:
                  _errorMessage != null
                      ? Theme.of(context).primaryColor
                      : const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      _errorMessage != null
                          ? Color(0xFFE08573)
                          : Colors.transparent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      _errorMessage != null
                          ? Color(0xFFE08573)
                          : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      _errorMessage != null
                          ? Color(0xFFE08573)
                          : Colors.transparent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        if (_errorMessage != null)
          Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              const SizedBox(width: 7),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.black, fontSize: 13),
              ),
            ],
          ),
      ],
    );
  }
}
