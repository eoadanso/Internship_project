
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;

  const TextInputField({Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context)
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 25
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: inputBorder,
          border: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(Icons.dialpad),
          ),
        ),
        keyboardType: textInputType,
      ),
    );
  }
}
