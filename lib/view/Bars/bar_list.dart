import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/view/Notifications/notificationTabBar.dart';
import 'package:mybar/widgets/bars_widget/new_bar_banners.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/common.dart';
import '../../constant.dart';
import '../../widgets/bars_widget/new_bar_banners.dart';
import '../Notifications/notificationTabBar.dart';

class Bar_List extends StatefulWidget {
  const Bar_List({super.key});

  @override
  State<Bar_List> createState() => _Bar_ListState();
}

class _Bar_ListState extends State<Bar_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        surfaceTintColor: secondryColor,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bars",
                    style: GoogleFonts.roboto(
                        color: Color(0xff4D4F50),
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ));
                  },
                  child: Image.asset(
                    "assets/icons/notification.png",
                    scale: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Stack(
          children: [
            Container(
              color: secondryColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEAEAEA),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: secondryColor,
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xffACACAC),
                              ),
                              suffixIcon: Image.asset(
                                "assets/icons/filter.png",
                                scale: 3,
                              ),
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                color: greyColor,
                              ),
                              hintText: "Search for Nearest Bar",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Color(0xff3C3C3C),
                                  ),
                                  Text(
                                    "Duxten Road, 338750",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3C3C3C),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Change",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Image.asset(
                                    "assets/icons/change.png",
                                    scale: 2.5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Color(0xffD3D3D3)),
                                right: BorderSide(color: Color(0xffD3D3D3)),
                                bottom: BorderSide(color: Color(0xffD3D3D3))),
                          ),
                          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/sort.png",
                                scale: 3,
                                color: Color(0xff4D4F50),
                              ),
                              // Icon(Icons.swap_vert),
                              SizedBox(
                                width: 2.w,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Text(
                                  "Sort",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff4D4F50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Color(0xffD3D3D3)),
                                bottom: BorderSide(color: Color(0xffD3D3D3))),
                          ),
                          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.filter_alt,
                                size: 25,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "Filter",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4D4F50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: bars.length,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewBarBanners(
                          barDetails: bars[index],
                          isVertical: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.5.h),
          ],
        ),
      ),
    );
  }
}
