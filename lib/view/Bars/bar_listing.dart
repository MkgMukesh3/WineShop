import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/view/Bars/bar_list.dart';
import 'package:mybar/view/Bars/featured_all_bars.dart';
import 'package:mybar/view/Notifications/notificationTabBar.dart';
import 'package:mybar/widgets/bars_widget/bar_banners.dart';
import 'package:mybar/widgets/bars_widget/new_bar_banners.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BarListing extends StatefulWidget {
  BarListing({super.key});

  @override
  State<BarListing> createState() => _BarListingState();
}

class _BarListingState extends State<BarListing> {
  List bannerList = [
    {"banner": "assets/images/barbanner.png"},
    {"banner": "assets/images/barbanner.png"},
  ];

  List<BarModel> favouriteList = [];

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
              height: 100.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: secondryColor,
                      child: Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              height: 1.5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured",
                            style: GoogleFonts.tajawal(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff424242),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeaturedAllBars()),
                              );
                            },
                            child: Text(
                              "View all",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      // width: 90.w,
                      height: 42.h,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            bars.length,
                            (index) => BarBanners(
                              barModel: bars[index],
                              backColor: secondryColor,
                              favouriteList: favouriteList,
                              addToFavourite: () {
                                favouriteList.contains(bars[index])
                                    ? favouriteList.remove(bars[index])
                                    : favouriteList.add(bars[index]);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New on mybar",
                            style: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff424242),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeaturedAllBars(),
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 19.0),
                              child: Text(
                                "View all",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.red,

                      height: 18.h,

                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          ...List.generate(
                              bars.length,
                              (index) => NewBarBanners(
                                    barDetails: bars[index],
                                  ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 2.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Special Offers",
                          style: GoogleFonts.tajawal(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff424242),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      //  width: 100.w,
                      height: 20.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: barList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              //height: 10.h,
                              width: 85.w,
                              child: Image.asset(
                                bannerList[index]['banner'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Near me",
                            style: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff424242),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Bar_List()),
                                );
                              },
                              child: Text(
                                "View all",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: bars.length,
                        physics: NeverScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
