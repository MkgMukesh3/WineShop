import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Bars/bar_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewBarBanners extends StatelessWidget {
  NewBarBanners(
      {super.key,
      required this.barDetails,
      this.isVertical,
      this.isFavourite,
      this.isSelectedBars,
      this.selectedBar,
      this.barSelection,
      this.removeFromFavourite});

  BarModel barDetails;
  bool? isVertical;
  bool? isFavourite;
  bool? isSelectedBars;
  BarModel? selectedBar;
  final Function? barSelection;
  Function? removeFromFavourite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelectedBars == true
            ? barSelection!()
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bar_Details()),
              );
      },
      child: Container(
        width: 80.w,
        margin: EdgeInsets.only(right: 4.w, bottom: 1.h, top: 1.h, left: 4.w),
        //padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 6,
                color:
                    Color(0x29000000), // The opacity value is in hex (29 = 16%)
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: selectedBar == barDetails
                ? Border.all(color: circleColor)
                : null),

        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 18.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          barDetails.barImage!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          width: 100.w,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "Featured",
                                style: GoogleFonts.tajawal(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: secondryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10.0,
                        right: isFavourite == true ? 10 : 30,
                        top: 20,
                        bottom: 20),
                    height: 18.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              barDetails.barName!,
                              style: GoogleFonts.tajawal(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff424242),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                '''${barDetails.barAddress}''',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // if (isVertical == true)
                        //   SizedBox(
                        //     height: 4.h,
                        //   ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: barDetails.barStatus == "Open"
                                      ? greenColor
                                      : redColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  barDetails.barStatus!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff424242),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/runner.png",
                                  color: isFavourite == true
                                      ? primaryColor
                                      : textColor,
                                  scale: 3,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  barDetails.barDistance!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff424242),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (isFavourite == true)
              Positioned(
                top: 5,
                left: 2,
                child: GestureDetector(
                  onTap: () {
                    removeFromFavourite!();
                  },
                  child: Icon(
                    Icons.favorite,
                    color: redColor,
                    size: 30,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
