import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/DataRepository/remoteService.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/providers/login_provider.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../Home/home_screen.dart';
import '../password/number_password.dart';
import '../signup/create_account.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SigninProvider>(builder: (context, signinProvider, child) {
        return Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in",
                        style: GoogleFonts.tajawal(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.h, bottom: 2.h),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: signinProvider.mobileNoController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondryColor,
                            border: InputBorder.none,
                            prefixIcon: Image.asset(
                              "assets/icons/phone.png",
                              scale: 3,
                            ),
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: greyColor,
                            ),
                            hintText: "Mobile Number",
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

                            // border: OutlineInputBorder(),
                          ),
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter phone number";
                            } else if (value!.length < 8) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        child: TextFormField(
                          controller: signinProvider.passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondryColor,
                            border: InputBorder.none,
                            prefixIcon: SizedBox(
                              height: 3.h,
                              child: Image.asset(
                                "assets/icons/lock.png",
                                scale: 3,
                              ),
                            ),
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
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: greyColor,
                            ),
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color(0xffF6F6F6)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffF6F6F6),
                              ), //<-- SEE HERE
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

                            // border: OutlineInputBorder(),
                          ),
                          obscureText: isPasswordVisible,
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.length < 6) {
                              return "Password should be atleast 6 characters";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await RemoteService.signIn(
                                contactNo:
                                    signinProvider.mobileNoController.text,
                                password:
                                    signinProvider.passwordController.text,
                                signinProvider: signinProvider,
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
                                "Sign in",
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
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Mobilepassword()),
                          );
                        },
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff969696),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I’m a new user, ",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.tajawal(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 40,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.tajawal(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: greyColor,
                    ),
                  )),
            ),
            if (signinProvider.isLoading == true)
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
