import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/size_config.dart';

const kPrimaryColor = Color.fromARGB(219, 255, 155, 40);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const String Google_API_key = "AIzaSyBqtfyF90JjZz0pCYrbcmhku4aj9KXRGjw";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(0),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const STORE_DATA = [
  {
    "name": "tiệm sửa xe mình đen",
    "address": "Hồ Chí Minh",
    "phone": "151351211515",
  },
  {
    "name": "tiệm sửa xe Tài",
    "address": "Hồ Chí Minh",
    "phone": "01354217815",
  },
  {
    "name": "tiệm sửa xe Kiên",
    "address": "Hồ Chí Minh",
    "phone": "05613501815",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
  {
    "name": "tiệm sửa xe trung",
    "address": "Hồ Chí Minh",
    "phone": "0561354515",
  },
];
