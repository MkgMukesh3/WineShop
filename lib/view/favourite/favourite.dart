import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/favourite/drinks.dart';
import 'package:mybar/view/favourite/favourite_bars.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key, required this.onBackTap});
  final Function onBackTap;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        surfaceTintColor: secondryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            widget.onBackTap();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Column(
          children: [
            Text(
              "Favourites",
              style: GoogleFonts.roboto(
                  color: Color(0xff4D4F50),
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: greyColor,
                          ),
                          hintText: "Search",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // height: 10.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: -2,
                      color: Color(
                          0x26000000), // The opacity value is in hex (26 = 15%)
                    ),
                  ],
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        dividerColor: Colors.white,
                        indicatorPadding: EdgeInsets.all(0),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(
                            // text: 'Drinks',
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/drinks.png",
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Drinks",
                                  style: GoogleFonts.roboto(
                                      color: Color(0xff4D4F50),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Tab(
                            // text: 'Bars',
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/bars.png",
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Bars",
                                  style: GoogleFonts.roboto(
                                      color: Color(0xff4D4F50),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Drinks(),
                            FavouriteBars(),
                          ],
                        ),
                      )
                    ],
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
