import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  String mobileNumber = "";

  TextEditingController mobileController = TextEditingController();

  changeMobileNum(String value) {
    mobileNumber = value;
    notifyListeners();
  }
}
