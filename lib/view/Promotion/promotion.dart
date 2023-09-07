import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/widgets/bars_widget/bar_banners.dart';
import 'package:mybar/widgets/promotion_widget/promotion_ad_banners.dart';
import 'package:mybar/widgets/promotion_widget/promotion_bars.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Promotion extends StatefulWidget {
  const Promotion({super.key, required this.onBackTap});
  final Function onBackTap;

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  List<BarModel> listOfFavouriteBars = [];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.sp),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(4, 4),
                blurRadius: 6,
                spreadRadius: -2,
              )
            ],
          ),
          child: AppBar(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promotions",
                      style: GoogleFonts.roboto(
                          color: Color(0xff4D4F50),
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 7,
                    spreadRadius: 0,
                    color: Color(
                        0x26000000), // The opacity value is in hex (26 = 15%)
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PromotionAdBanner(),
            ...List.generate(
              bars.length,
              (index) => PromotionBars(
                  backColor: Colors.white,
                  barModel: bars[index],
                  favouriteList: listOfFavouriteBars,
                  addToFavourite: () {
                    listOfFavouriteBars.contains(bars[index])
                        ? listOfFavouriteBars.remove(bars[index])
                        : listOfFavouriteBars.add(bars[index]);
                    setState(() {});
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
              child: Image.asset(
                "assets/images/barbanner.png",
              ),
            )
          ],
        ),
      ),
    );
  }
}
