import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/default_button.dart';
import 'package:flutter_complete_guide/components/form_error.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/home/product_screen.dart';
import 'package:flutter_complete_guide/models/customer.dart';
import 'package:flutter_complete_guide/service/api_service.dart';
import 'package:flutter_complete_guide/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  String value;
  SignUpForm({Key key, this.value}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

final ApiService api = ApiService();
TextEditingController nameController = TextEditingController();
TextEditingController gmailController = TextEditingController();

class _SignUpFormState extends State<SignUpForm> {
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  checkphone(String phoneNumber) async {
    bool checkPhoneNumber = await isPhoneNumberLinked(phoneNumber);
    if (checkPhoneNumber == true) {
      return true;
    } else {
      return false;
    }
  }

  checkadd(String name, String phone, String gmail) async {
    bool checkAdd = await createAccountWithGmailAndPhone(name, phone, gmail);
    if (checkAdd == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String phone = widget.value.toString();
    Customer customer;
    return Form(
      child: Column(
        children: [
          buildProfileFormField(),
          SizedBox(height: getProportionateScreenHeight(30 * size.height)),
          buildGmail(),
          SizedBox(height: getProportionateScreenHeight(30 * size.height)),
          FormError(errors: errors),
          DefaultButton(
            text: "Continue",
            press: () {
              customer = new Customer(
                  name: nameController.text,
                  phoneNumber: phone,
                  email: gmailController.text);
              api.createCustomer(customer);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductScreen()));
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildGmail() {
    return TextFormField(
      controller: gmailController,
      obscureText: false,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Gmail",
        hintText: "Enter your Gmail",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: SvgPicture.asset(
          "assets/icons/Lock.svg",
          width: 40,
        ),
      ),
    );
  }

  TextFormField buildProfileFormField() {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Input your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: SvgPicture.asset(
          "assets/icons/user.svg",
          width: 40,
        ),
      ),
    );
  }

  /*void signup(String name, String phone, String email) async {
    customer = Customer(name: name, phoneNumber: phone, email: email);
    var response = await http.post(
        Uri.parse("http://52.73.161.142/api/Customer/add-customer"),
        headers: {"Content-type": "application/json"},
        body: json.encode(customer.toJson()));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProductScreen();
        },
      ),
    );
  }*/

  static Future<bool> isPhoneNumberLinked(String phoneController) async {
    String phone;
    var url =
        "https://nmrp3a0bjc.execute-api.us-east-1.amazonaws.com/Prod/api/Customer/get-by-phonenumber/";
    String URL = url + phone.toString();
    var data = await http.get(Uri.parse(URL));
    var jsonData = json.decode(data.body);
    if (jsonData != null) {
      // if got data, return true
      Future<bool>.value(true);
    } else {
      Future<bool>.value(false);
    }
  }

  Future<bool> createAccountWithGmailAndPhone(
      String name, String phoneNumber, String email) async {
    var url =
        "https://nmrp3a0bjc.execute-api.us-east-1.amazonaws.com/Prod/api/Customer/add-customer";
    final http.Response response = await http.post(Uri.parse(url));

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var body = json.encode(<String, String>{
      "name": name,
      "phoneNumber": phoneNumber,
      "email": email
    });

    if (response.statusCode == 201) {
      Customer.fromJson(json.decode(response.body));
      Future<bool>.value(true);
    } else {
      Future<bool>.value(false);
      throw Exception('customer loading failed!');
    }
  }
}
