import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/number_otp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Mobilepassword extends StatefulWidget {
  const Mobilepassword({Key? key}) : super(key: key);

  @override
  _MobilepasswordState createState() => _MobilepasswordState();
}

class _MobilepasswordState extends State<Mobilepassword> {
  final _formKey = GlobalKey<FormState>();
  String _mobileNumber = '';
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    RegExp regex = RegExp(r'^[0-9]{10}$');
    setState(() {
      _isButtonEnabled = regex.hasMatch(_mobileNumber);
    });
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
                "Forgot Your Password?",
                style: GoogleFonts.tajawal(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff424242),
                ),
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Text(
                "Enter your registered mobile number to receive OTP",
                style: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff969696),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                children: [
                  Container(
                    // height: 10.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(8),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _mobileNumber = value;
                            _updateButtonState();
                          });
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          border: InputBorder.none,
                          hintText: 'Mobile Number',
                          hintStyle: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffF6F6F6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffF6F6F6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffF6F6F6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffF6F6F6)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter mobile number";
                          } else if (value.length < 8) {
                            return "Please enter valid mobile number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  // Only navigate to the OTP screen if the mobile number is valid
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Otpscreen()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffC11331),
                    ),
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 12.w, right: 12.w, top: 1.h, bottom: 0.8.h),
                    child: Text(
                      "SEND",
                      style: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffC11331),
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
      ),
    );
  }
}
