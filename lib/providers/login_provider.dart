import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController get mobileNoController => _mobileNoController;
  TextEditingController get passwordController => _passwordController;

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void clear() {
    _mobileNoController.clear();
    _passwordController.clear();
    notifyListeners();
  }
}
