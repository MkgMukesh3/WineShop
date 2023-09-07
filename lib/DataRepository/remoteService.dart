import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybar/providers/verify_account_provider.dart';
import 'package:mybar/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/common.dart';
import '../model/signupRespModel.dart';
import '../providers/login_provider.dart';
import '../providers/signup_provider.dart';
import '../view/Home/home_screen.dart';
import '../view/signin/signin.dart';
import '../view/verify/account_verify.dart';

class RemoteService {
  static Future<http.Response> apiRequestPostMethod(
      String url, Map jsonMap) async {
    //var body = json.encode(jsonMap);
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: jsonMap,
    );
    return response;
  }

  static signup(
      {required String contactNo,
      required String email,
      required String dob,
      required String password,
      required SignupProvider signupProvider,
      required BuildContext context}) async {
    try {
      signupProvider.setIsLoading(true);
      Map<String, dynamic> mapData = {
        'contact': contactNo,
        'email': email,
        'dob': dob,
        'password': password
      };
      var resp = await apiRequestPostMethod("${baseUrl}register", mapData);
      if (resp.statusCode == 200) {
        SignupRespModel signupRespModel =
            SignupRespModel.fromJson(jsonDecode(resp.body));
        if (signupRespModel.status == true) {
          print(" message==> ${signupRespModel.message}");
          showCustomToast("${signupRespModel.message}");
          signupProvider.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AccountVerify(
                      customerId: signupRespModel.ecomAfCustomerId.toString(),
                    )),
          );
        } else {
          showCustomToast("${signupRespModel.message}");
        }
      } else {
        showCustomToast("Something Error!");
      }
      signupProvider.setIsLoading(false);
    } catch (e) {
      signupProvider.setIsLoading(false);
      showCustomToast("${e.toString()}");
    }
  }

  static verifyOtp({
    required String otp,
    required String customerId,
    required VerifyAccountProvider verifyAccountProvider,
    required BuildContext context,
  }) async {
    try {
      verifyAccountProvider.setIsLoading(true);
      Map<String, dynamic> mapData = {
        'ecom_af_customer_id': customerId,
        'otp': otp,
      };
      var resp =
          await apiRequestPostMethod("${baseUrl}verify_confirm_otp", mapData);
      if (resp.statusCode == 200) {
        SignupRespModel signupRespModel =
            SignupRespModel.fromJson(jsonDecode(resp.body));
        if (signupRespModel.status == true) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("userId", customerId);
          showCustomToast("${signupRespModel.message}");
          verifyAccountProvider.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          showCustomToast("${signupRespModel.message}");
        }
      } else {
        showCustomToast("Something Error!");
      }
      verifyAccountProvider.setIsLoading(false);
    } catch (e) {
      verifyAccountProvider.setIsLoading(false);
      showCustomToast("${e.toString()}");
    }
  }

  static signIn(
      {required String contactNo,
      required String password,
      required SigninProvider signinProvider,
      required BuildContext context}) async {
    try {
      signinProvider.setIsLoading(true);
      Map<String, dynamic> mapData = {
        'contact': contactNo,
        'password': password
      };
      var resp = await apiRequestPostMethod("${baseUrl}login", mapData);
      if (resp.statusCode == 200) {
        SignupRespModel signupRespModel =
            SignupRespModel.fromJson(jsonDecode(resp.body));
        if (signupRespModel.status == true) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              "userId", signupRespModel.ecomAfCustomerId.toString());

          showCustomToast("${signupRespModel.message}");
          signinProvider.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          showCustomToast("${signupRespModel.message}");
        }
      } else {
        showCustomToast("Something Error!");
      }
      signinProvider.setIsLoading(false);
    } catch (e) {
      signinProvider.setIsLoading(false);
      showCustomToast("${e.toString()}");
    }
  }
}
