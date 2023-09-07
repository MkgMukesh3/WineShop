import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsRedeemProduct extends StatelessWidget {
  DetailsRedeemProduct({super.key, this.onTpWidget, required this.detailsData});
  var detailsData;
  final Function? onTpWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onTpWidget();
      },
      child: Column(
        children: [
          const Divider(
            color: Color(0xffACACAC),
          ),
          GestureDetector(
            onTap: () {
              // onTpWidget();
            },
            child: ListTile(
              leading: Container(
                  height: 15.h,
                  width: 15.w,
                  // color: Colors.blue,
                  child: Image.asset(
                    detailsData['cartImage'],
                    fit: BoxFit.contain,
                  )),
              title: Text(
                detailsData['cartName'],
                style: GoogleFonts.tajawal(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4D4F50)),
              ),
              subtitle: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            detailsData['cartDes'],
                            style: GoogleFonts.tajawal(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242)),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              detailsData['date'],
                              style: GoogleFonts.tajawal(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      detailsData['cartName'] == 'Bud Lite'
                          ? Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF26B90E),
                                      Color(0xFF26B90E)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.w,
                                      right: 4.w,
                                      top: 0.5.h,
                                      bottom: 0.5.h),
                                  child: Text("Added",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => RedeemScreen(),
                                //   ),
                                // );
                              },
                              child: Container(
                                // height: 4.h,
                                // width: 30.w,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Color(0xFFCA1D3B),
                                        Color(0xFF871327)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(30)),

                                margin: EdgeInsets.only(bottom: 0.5.h),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.w,
                                        right: 4.w,
                                        top: 0.5.h,
                                        bottom: 0.5.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Add',
                                          style: GoogleFonts.roboto(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
