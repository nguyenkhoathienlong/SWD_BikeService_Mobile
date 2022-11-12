import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String textline;
  const CustomDropdown({Key key, this.textline}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue;
  bool isDropdownOpened;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.textline,
            style: TextStyle(
              color: Colors.green,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: DropdownButton(
              items: [
                DropdownMenuItem(child: Text("Honda"), value: "Honda"),
                DropdownMenuItem(child: Text("Yamaha"), value: "Yamaha"),
                DropdownMenuItem(child: Text("Kawasaki"), value: "Kawasaki"),
                DropdownMenuItem(child: Text("Sirius"), value: "Sirius"),
              ],
              value: dropdownValue,
              onChanged: dropdownCallBack,
            ),
          )
        ],
      ),
    );
  }

  void dropdownCallBack(String value) {
    if (value is String) {
      setState(() {
        dropdownValue = value;
      });
    }
  }
}
