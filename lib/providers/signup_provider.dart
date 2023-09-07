import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController _dobController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController get dobController => _dobController;
  TextEditingController get mobileNoController => _mobileNoController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void clear() {
    _dobController.clear();
    _mobileNoController.clear();
    _emailController.clear();
    _passwordController.clear();
    notifyListeners();
  }
}
