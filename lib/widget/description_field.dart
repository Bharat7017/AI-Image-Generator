// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DescriptionField extends StatefulWidget {
  final void Function(String prompt) _onSubmitted;
  const DescriptionField(
      {super.key, required Function(String prompt) onSubmitted})
      : _onSubmitted = onSubmitted;

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _descController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _descController,
          focusNode: focusNode,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              splashColor: Colors.white70,
              splashRadius: 25,
              onPressed: () {
                final desc = _descController.text;
                _descController.clear();
                focusNode.unfocus();
                widget._onSubmitted(desc);
              },
              icon: Icon(Icons.send),
            ),
            hintText: "Input a description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Made By Aman Agrawal",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
        )
      ],
    );
  }
}
