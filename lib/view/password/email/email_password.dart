import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/email/email_otp.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Emailpassword extends StatefulWidget {
  Emailpassword({Key? key}) : super(key: key);

  @override
  _EmailpasswordState createState() => _EmailpasswordState();
}

class _EmailpasswordState extends State<Emailpassword> {
  TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _isButtonEnabled() {
    String email = _emailController.text.trim();
    return email.isNotEmpty && email.contains("@");
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
                    "assets/images/lock.png",
                    scale: 3.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.8.h,
            ),
            Text(
              "Forgot your Password?",
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff424242),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "Enter your registered email to receive OTP",
              style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff969696),
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
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "jordan@example.com",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff969696),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!_isValidEmail) ...[
              SizedBox(height: 2.h),
              Text(
                "Please enter a valid email address",
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
                  _isValidEmail = _emailController.text.trim().isNotEmpty &&
                      _emailController.text.contains("@");
                });
                if (_isButtonEnabled() && _isValidEmail) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Emailotp()),
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
                    "SEND",
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
