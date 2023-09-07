import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/password_change.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class EmailCreatepass extends StatefulWidget {
  EmailCreatepass({Key? key}) : super(key: key);

  @override
  _EmailCreatepassState createState() => _EmailCreatepassState();
}

class _EmailCreatepassState extends State<EmailCreatepass> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;

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
              padding: EdgeInsets.only(left: 4.h, right: 4.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: const [],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 1.5.h),
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.h, right: 4.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: const [],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 1.5.h),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!_passwordsMatch) ...[
              SizedBox(height: 2.h),
              Text(
                "Passwords do not match!",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _passwordsMatch = _newPasswordController.text ==
                      _confirmPasswordController.text;
                });
                if (_isButtonEnabled() && _passwordsMatch) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePass()),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff851729),
                      Color(0xffAF1731),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 1.h, bottom: 0.8.h),
                  child: Text(
                    "CREATE",
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: secondryColor,
                    ),
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
    );
  }
}
