import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCombos extends StatelessWidget {
  const AllCombos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        surfaceTintColor: secondryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Combos",
                  style: GoogleFonts.roboto(
                    color: Color(0xff4D4F50),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20),
        child: SizedBox(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, pagePosition) {
                return Container(
                  height: 25.h,
                  width: 10.w,
                  margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 0.h),
                  padding: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.h),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 246, 166, 0),
                        Color(0xFFFFF6A6)
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Image.asset(
                                      "assets/icons/crown.png",
                                      scale: 3,
                                    ),
                                  ),
                                  Text(
                                    "Top of the week",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff4D4F50),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "MIX COMBO",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4F50),
                                ),
                              ),
                              Text(
                                "\$150",
                                style: GoogleFonts.roboto(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4F50),
                                ),
                              ),
                              Image.asset(
                                "assets/images/rating.png",
                                scale: 3,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(width: 1)),
                                padding: const EdgeInsets.all(8.0),
                                margin: EdgeInsets.only(top: 1.h),
                                child: Text(
                                  "Reedem Now",
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4D4F50),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          "assets/images/combo.png",
                          height: 25.h,
                          // scale: 4,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
