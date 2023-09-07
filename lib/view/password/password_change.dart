import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/password/number_otp.dart';
import 'package:mybar/view/signin/signin.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

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
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Password Changed !",
              style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff7C7C7C),
              ),
            ),
            Center(
              child: Container(
                //  color: Colors.brown,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Image.asset(
                    "assets/images/passwordchange.png",
                    scale: 3.7,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
              child: Text(
                textAlign: TextAlign.center,
                "You have changed your password Successfully !",
                style: GoogleFonts.tajawal(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(7.h),
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
                    // border: Border.all(color: Color(0xffC11331)),
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 14.w, right: 14.w, top: 1.4.h, bottom: 1.h),
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.tajawal(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: secondryColor,
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
    );
  }
}
