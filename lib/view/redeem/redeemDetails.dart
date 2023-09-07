import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/Home/home_screen.dart';
import 'package:mybar/view/order/order_history.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedeemDetails extends StatefulWidget {
  const RedeemDetails({super.key});

  @override
  State<RedeemDetails> createState() => _RedeemDetailsState();
}

class _RedeemDetailsState extends State<RedeemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 18.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(133, 23, 41, 1),
                    Color.fromRGBO(175, 23, 49, 1)
                  ]),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Redeemed Details",
                    style: GoogleFonts.tajawal(
                      fontSize: 19.5.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              passIndex: 1,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 14.h, left: 6.w, right: 6.w),
              height: 14.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Color of the shadow
                    blurRadius: 10.0, // Spread of the shadow
                    offset:
                        Offset(4, 4), // Horizontal and vertical offsets (X, Y)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: Text(
                      "Redeemed",
                      style: GoogleFonts.roboto(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(193, 19, 49, 1),
                      ),
                    ),
                  ),
                  Text("NewTown Bar",
                      style: GoogleFonts.tajawal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(123, 123, 123, 1),
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "20 Jun 2021 10:00 PM",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(66, 66, 66, 1),
                    ),
                  ),
                ],
              )),
          Column(
            children: [
              Container(
                height: 35.h,
                margin: EdgeInsets.only(top: 36.h, left: 6.w, right: 6.w),
                //color:
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Color of the shadow
                      blurRadius: 10.0, // Spread of the shadow
                      offset: Offset(
                          4, 4), // Horizontal and vertical offsets (X, Y)
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 3.h),
                          child: Image.asset(
                            "assets/images/products/product3.png",
                            height: 13.h,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Chivas Regal 12",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 19.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(77, 79, 80, 1),
                                  )),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text("60ml - 2 Glass",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 17.5.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(123, 123, 123, 1),
                                  )),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text("Pepsi",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(123, 123, 123, 1),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: DottedLine(),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.w, top: 3.h),
                          child: Image.asset(
                            "assets/images/products/product7.png",
                            height: 13.h,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bud Lite",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 19.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(77, 79, 80, 1),
                                  )),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text("2 Pints",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 17.5.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(123, 123, 123, 1),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderHistoryScreen(),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 7.h),
                  height: 6.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(133, 23, 41, 1),
                        Color.fromRGBO(175, 23, 49, 1)
                      ]),
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Center(
                    child: Text("View Orders",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
