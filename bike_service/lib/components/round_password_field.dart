import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/text_field_container.dart';
import 'package:flutter_complete_guide/constrain.dart';

class RoundPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryLightColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryLightColor,
          ),
        ),
      ),
    );
  }
}
