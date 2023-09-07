import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/email/email_password.dart';
import 'package:mybar/view/password/password_change.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Newpassword extends StatefulWidget {
  Newpassword({Key? key}) : super(key: key);

  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordsMatch = true;

  bool _validate = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isButtonEnabled() {
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    return newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword == confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
      ),
      backgroundColor: secondryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 7.h),
                    child: Image.asset(
                      "assets/images/createpassword.png",
                      scale: 3.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.8.h,
              ),
              Text(
                "Create a New Password",
                style: GoogleFonts.tajawal(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff424242),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Container(
                  child: TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      errorText: _validate ? "Value Can't Be Empty" : null,
                      hintText: "New Password",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please eneter new password";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Color(0xffF6F6F6),
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   boxShadow: const [],
                  // ),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color(0xffF6F6F6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please eneter confirm password";
                      } else if (value! != _newPasswordController.text) {
                        return "Password does not match!";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePass()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffC11331)),
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 12.w, right: 12.w, top: 1.h, bottom: 0.8.h),
                    child: Text(
                      "CREATE",
                      style: GoogleFonts.tajawal(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: _isButtonEnabled() && _passwordsMatch
                              ? Color(0xffBE212F)
                              : Color(0xffBE212F)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.tajawal(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4D4F50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
