import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/new_password.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Otpscreen extends StatefulWidget {
  Otpscreen({Key? key}) : super(key: key);

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController _otpController = TextEditingController();
  bool _isOtpFilled = true; // State variable to track OTP field validation
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: secondryColor),
      backgroundColor: secondryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 25.h,
                  width: 35.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/meassage.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: Image.asset(
                      "assets/images/star.png",
                      scale: 3.5,
                    ),
                  ),
                ),
                Text(
                  "Enter OTP",
                  style: GoogleFonts.tajawal(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff424242),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "OTP sent to your mobile number",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff969696),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  controller: _otpController,
                  validator: (s) {
                    setState(() {
                      _isOtpFilled = s?.isNotEmpty ?? false;
                    });
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                if (!_isOtpFilled) ...[
                  SizedBox(height: 1.h),
                  Text(
                    "Please enter the OTP",
                    style: TextStyle(
                      fontSize: 14.sp,
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
                      _isOtpFilled = _otpController.text.isNotEmpty;
                    });
                    if (_isOtpFilled) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newpassword()),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffBE212F),
                      ),
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w, top: 1.h, bottom: 0.8.h),
                      child: Text(
                        "CONFIRM",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffBE212F),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextButton(
                  child: Text(
                    'Resend OTP',
                    style: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: enableResend ? primaryColor : Color(0xff969696),
                    ),
                  ),
                  onPressed: enableResend ? _resendCode : null,
                ),
                enableResend
                    ? Container()
                    : Text(
                        '(after $secondsRemaining seconds)',
                        style: GoogleFonts.tajawal(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
