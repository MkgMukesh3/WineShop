import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/profile/profile_chnaged_pass.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profilepass extends StatefulWidget {
  const Profilepass({super.key});

  @override
  _ProfilepassState createState() => _ProfilepassState();
}

class _ProfilepassState extends State<Profilepass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Declare variables to store the form field values
  String _currentPassword = '';
  String _newPassword = '';
  String _confirmNewPassword = '';
  bool isPasswordVisible = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileChangedPass()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: GoogleFonts.roboto(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff4D4F50),
          ),
        ),
        surfaceTintColor: secondryColor, // Replace with your color
        backgroundColor: secondryColor, // Replace with your color
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondryColor, // Replace with your color
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.0, 1.0),
                        color: Color(0x33000000),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Current Password",
                            isDense: true,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your current password';
                            }
                            // Add any additional validation here if needed
                            return null;
                          },
                          onSaved: (value) {
                            _currentPassword = value!;
                          },
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            isDense: true,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a new password';
                            }
                            // Add any additional validation here if needed
                            return null;
                          },
                          onChanged: (value) {
                            _newPassword = value!;
                          },
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        TextFormField(
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Confirm New Password",
                            suffixIcon: SizedBox(
                              height: 3.h,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: isPasswordVisible == true
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: greyColor,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: greyColor,
                                      ),
                              ),
                            ),
                            isDense: true,
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter confirm new password';
                            } else if (value != _newPassword) {
                              return 'Password Mismatch!';
                            }
                            // Add any additional validation here if needed
                            return null;
                          },
                          onSaved: (value) {
                            _confirmNewPassword = value!;
                          },
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              GestureDetector(
                onTap: _submitForm,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Container(
                    width: double.infinity,
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
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 1.9.h,
                          bottom: 1.2.h,
                        ),
                        child: Text(
                          "CHANGE PASSWORD",
                          style: GoogleFonts.tajawal(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: secondryColor, // Replace with your color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
