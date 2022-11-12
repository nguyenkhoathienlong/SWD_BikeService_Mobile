import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/text_field_container.dart';

class RoundInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color color;
  const RoundInputField({
    Key key,
    this.hintText,
    this.icon = Icons.phone_android,
    this.keyboardType,
    this.onChanged,
    this.controller,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(239, 239, 239, 100),
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
