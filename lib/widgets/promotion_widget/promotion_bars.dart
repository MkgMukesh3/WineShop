import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/view/Bars/bar_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PromotionBars extends StatelessWidget {
  PromotionBars({
    super.key,
    required this.backColor,
    required this.barModel,
    required this.addToFavourite,
    required this.favouriteList,
  });

  Color backColor;
  final Function addToFavourite;
  final BarModel barModel;
  List<BarModel> favouriteList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bar_Details()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
        decoration: BoxDecoration(
          color: backColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bars.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff26B90E),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 10, right: 15, bottom: 5),
                          child: Text(
                            "50% Off",
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 7,
                  child: favouriteList.contains(barModel)
                      ? GestureDetector(
                          onTap: () {
                            addToFavourite();
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 4.5.h,
                            color: Colors.red,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            addToFavourite();
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 4.5.h,
                            color: secondryColor,
                          ),
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Charlie’s Bar",
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      color: backColor == Colors.white
                          ? Color(0xff3C3C3C)
                          : secondryColor,
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/runner.png",
                            color: backColor == Colors.white
                                ? Color(0xff3C3C3C)
                                : secondryColor,
                            scale: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 15, bottom: 8, top: 8),
                            child: Text(
                              "2.8km",
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: backColor == Colors.white
                                    ? Color(0xff3C3C3C)
                                    : secondryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/active.png",
                            scale: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 15, bottom: 8, top: 8),
                            child: Text(
                              "Open",
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: backColor == Colors.white
                                    ? Color(0xff3C3C3C)
                                    : secondryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/rating.png",
                        scale: 3,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                    child: Text(
                      "New Bar added nearby you",
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: backColor == Colors.white
                            ? Color(0xff3C3C3C)
                            : secondryColor,
                      ),
                    ),
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
