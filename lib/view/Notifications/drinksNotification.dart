import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/widgets/Notifications/newBar.dart';
import 'package:mybar/widgets/Notifications/newDrinks.dart';
import 'package:mybar/widgets/Notifications/paymentFailed.dart';
import 'package:mybar/widgets/Notifications/redeemedSucessfully.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrinksNotification extends StatefulWidget {
  const DrinksNotification({super.key});

  @override
  State<DrinksNotification> createState() => _DrinksNotificationState();
}

class _DrinksNotificationState extends State<DrinksNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 2.h),
              child: Text(
                "Drinks",
                style: GoogleFonts.tajawal(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3C3C3C),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                "Today",
                style: GoogleFonts.tajawal(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA1A1A1),
                ),
              ),
            ),
            RedeemedSuccessfullyWidget(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                "12/3/2021    1:30 PM",
                style: GoogleFonts.tajawal(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA1A1A1),
                ),
              ),
            ),
            PaymentfailedWidget(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                "9/3/2021    7:20 PM",
                style: GoogleFonts.tajawal(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA1A1A1),
                ),
              ),
            ),
            NewBarAddedWidget(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 2.h),
              child: Text(
                "7/3/2021    4:10 PM",
                style: GoogleFonts.tajawal(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA1A1A1),
                ),
              ),
            ),
            NewDrinksUpdated(),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
