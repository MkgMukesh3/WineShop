import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/purchaseinformation.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class OpenHistoryWidget extends StatefulWidget {
  const OpenHistoryWidget({super.key});

  @override
  State<OpenHistoryWidget> createState() => _OpenHistoryWidgetState();
}

class _OpenHistoryWidgetState extends State<OpenHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PurchaseInformation(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
        height: 13.h,
        // width: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.sp),
            bottomLeft: Radius.circular(10.sp),
            topRight: Radius.circular(14.sp),
            bottomRight: Radius.circular(15.sp),
          ),
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(4, 4),
              blurRadius: 6,
              spreadRadius: -2,
            )
          ],
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 3.h,
              width: 24.w,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(38, 185, 14, 1),
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Center(
                child: Text(
                  'Purchased',
                  style: GoogleFonts.roboto(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 2.w),
                height: 15.h,
                width: 30.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(4, 4),
                        blurRadius: 6,
                        spreadRadius: -2,
                      ),
                    ],
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/products/product3.png"),
                        fit: BoxFit.contain)),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.5.w, top: 1.5.h),
                        child: Text(
                          "Purchase Id: 4030304215455",
                          style: GoogleFonts.tajawal(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(66, 66, 66, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.5.w, top: 0.5.h),
                        child: Text(
                          "Purchased On: 12 Jun 2020",
                          style: GoogleFonts.tajawal(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(77, 79, 80, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, top: 0.5.h),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/percent.png",
                              fit: BoxFit.contain,
                              scale: 10.sp,
                            ),
                            Container(
                              height: 1.8.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(181, 29, 54, 1))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 1.w),
                                child: Text("W534V7K6",
                                    style: GoogleFonts.tajawal(
                                        color: Color.fromRGBO(77, 79, 80, 0.6),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Applied",
                              style: GoogleFonts.tajawal(
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(77, 79, 80, 0.6)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w, top: 1.5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3 Items",
                          style: GoogleFonts.tajawal(
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(77, 79, 80, 0.6)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "\$262",
                            style: GoogleFonts.tajawal(
                                fontSize: 18.5.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(77, 79, 80, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CharlieBar extends StatelessWidget {
  const CharlieBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
      height: 13.h,
      width: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.sp),
          bottomLeft: Radius.circular(10.sp),
          topRight: Radius.circular(14.sp),
          bottomRight: Radius.circular(15.sp),
        ),
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(4, 4),
            blurRadius: 6,
            spreadRadius: -2,
          )
        ],
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 3.h,
            width: 24.w,
            decoration: BoxDecoration(
                color: Color.fromRGBO(181, 29, 54, 1),
                borderRadius: BorderRadius.circular(20.sp)),
            child: Center(
              child: Text(
                'Redeemed',
                style: GoogleFonts.roboto(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              padding: EdgeInsets.only(left: 10.w),
              height: 3.h,
              width: 24.w,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.close))),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 2.w),
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Color(0xFFffffff),
                  image: DecorationImage(
                      image: AssetImage("assets/images/helena2.png"),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.w, top: 1.5.h),
                      child: Text(
                        "Charlie’s Bar",
                        style: GoogleFonts.tajawal(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(66, 66, 66, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.w,
                      ),
                      child: Text(
                        "Redeemed : Chivas Regal Whisky",
                        style: GoogleFonts.tajawal(
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(77, 79, 80, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.w,
                      ),
                      child: Text(
                        "Redeemed On : 20 May 2020 10:05 AM",
                        style: GoogleFonts.tajawal(
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(77, 79, 80, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0.3.h,
                        left: 1.w,
                      ),
                      child: Text(
                        "50 ml - 1 Glass",
                        style: GoogleFonts.tajawal(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(77, 79, 80, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
