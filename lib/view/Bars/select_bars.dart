import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/order/order_history.dart';
import 'package:mybar/view/redeem/redeem.dart';
import 'package:mybar/view/redeem/redeemDetails.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/bars_widget/new_bar_banners.dart';

class Selectbars extends StatefulWidget {
  Selectbars({super.key, required this.productDetails});
  ProductModel productDetails;

  @override
  State<Selectbars> createState() => _SelectbarsState();
}

class _SelectbarsState extends State<Selectbars> {
  BarModel? selectedBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.sp),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(3, 3),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: secondryColor,
            surfaceTintColor: secondryColor,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Bars",
                        style: GoogleFonts.roboto(
                            color: Color(0xff4D4F50),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0,
                            0.16), // Equivalent to #000000 with 16% opacity
                        offset: Offset(3, 3),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                              "assets/images/products/product1.png"),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chivas Regal",
                              style: GoogleFonts.tajawal(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4D4F50),
                              ),
                            ),
                            Text(
                              "Available Qty: 500 ml",
                              style: GoogleFonts.tajawal(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff424242),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/watch.png",
                                  scale: 3,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  "Valid until: 20 Jun 2021",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff424242),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w, left: 4.w),
                  child: Text(
                    "Redeemable in Bars",
                    style: GoogleFonts.tajawal(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w, left: 4.w),
                  child: Text(
                    "Select your nearest bar and redeem your drink",
                    style: GoogleFonts.tajawal(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffACACAC),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 100.w,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: bars.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewBarBanners(
                            barDetails: bars[index],
                            isVertical: true,
                            isFavourite: false,
                            isSelectedBars: true,
                            selectedBar: selectedBar,
                            barSelection: () {
                              selectedBar = bars[index];
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    selectedBar != null
                        ? Container(
                            height: 9.h,
                          )
                        : Container(
                            margin: EdgeInsets.all(20),
                          ),
                  ],
                )
              ],
            ),
          ),
          selectedBar != null
              ? Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RedeemScreen(
                            productDetails: widget.productDetails,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 2.h),
                      width: 60.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.tajawal(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: secondryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
