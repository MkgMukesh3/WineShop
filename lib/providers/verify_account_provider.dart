import 'package:flutter/material.dart';

class VerifyAccountProvider extends ChangeNotifier {
  TextEditingController _dobController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController get dobController => _dobController;

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void clear() {
    _dobController.clear();

    notifyListeners();
  }
}
