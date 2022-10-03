import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/text_field_container.dart';
import 'package:flutter_complete_guide/constrain.dart';

class RoundInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  const RoundInputField({
    Key key,
    this.hintText,
    this.icon = Icons.phone_android,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryLightColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
