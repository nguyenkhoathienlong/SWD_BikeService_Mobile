import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SizeBoxOtp extends StatelessWidget {
  final TextEditingController txtOtp;
  const SizeBoxOtp(
    String s, {
    Key key,
    this.txtOtp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //kich thước ô
      height: 68,
      width: 64,
      child: TextFormField(
        //tự động chuyển sang ố kế
        onChanged: (Value) {
          if (Value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        controller: txtOtp,
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        inputFormatters: [
          //giới hạn đô dài ký tự mỗi ô opt
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          fillColor: Colors.orange,
          filled: true,
        ),
      ),
    );
  }
}
