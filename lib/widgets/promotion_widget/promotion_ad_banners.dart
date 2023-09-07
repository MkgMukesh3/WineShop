import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/Bars/bar_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PromotionAdBanner extends StatelessWidget {
  PromotionAdBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Bar_Details()),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
        decoration: BoxDecoration(
            color: secondryColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/bottom_banner.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grab your Drink now at your nearest bar.",
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3C3C3C),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "View all bars",
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff3C3C3C).withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color(0xff3C3C3C).withOpacity(0.65),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
