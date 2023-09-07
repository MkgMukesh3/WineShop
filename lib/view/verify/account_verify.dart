import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/DataRepository/remoteService.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/providers/verify_account_provider.dart';
import 'package:mybar/view/Home/home_screen.dart';
import 'package:mybar/view/signin/signin.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountVerify extends StatefulWidget {
  AccountVerify({super.key, required this.customerId});

  String customerId;

  @override
  State<AccountVerify> createState() => _AccountVerifyState();
}

class _AccountVerifyState extends State<AccountVerify> {
  TextEditingController _otpController = TextEditingController();
  bool _isOtpFilled = true;

  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  void initState() {
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
    super.initState();
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
      width: 50,
      height: 50,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
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
      body: Consumer<VerifyAccountProvider>(
          builder: (context, verifyAccountProvider, child) {
        return Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Verify Your Account",
                      style: GoogleFonts.tajawal(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "OTP sent to your mobile number",
                      style: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff969696),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Enter OTP",
                      style: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff969696),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Pinput(
                      length: 6,
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
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _isOtpFilled = _otpController.text.isNotEmpty;
                        });
                        if (_isOtpFilled) {
                          await RemoteService.verifyOtp(
                              otp: _otpController.text,
                              customerId: widget.customerId,
                              verifyAccountProvider: verifyAccountProvider,
                              context: context);
                        }
                      },
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              gradientColor,
                              gradientColor1,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                            child: Text(
                              "Confirm",
                              style: GoogleFonts.tajawal(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: secondryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextButton(
                      child: Text(
                        'Resend OTP',
                        style: GoogleFonts.tajawal(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              enableResend ? primaryColor : Color(0xff969696),
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
            Positioned(
              top: 40,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            if (verifyAccountProvider.isLoading == true)
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Loading",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
          ],
        );
      }),
    );
  }
}
