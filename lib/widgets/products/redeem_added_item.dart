import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Home/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedeemAddedItems extends StatefulWidget {
  RedeemAddedItems({
    super.key,
    required this.productDetails,
  });
  ProductModel productDetails;

  @override
  State<RedeemAddedItems> createState() => _RedeemAddedItemsState();
}

class _RedeemAddedItemsState extends State<RedeemAddedItems> {
  List<String> addedItemQuantityAvailable = [
    "Pint (500 ml)",
    "Pitcher (2 ltr)",
    "Tower (3 ltr)"
  ];
  String selectedAddedItemQuantity = "Pint (500 ml)";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 3.h),
      padding: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(
                0, 0, 0, 0.16), // Equivalent to #000000 with 16% opacity
            offset: Offset(3, 3),
            blurRadius: 4,
            spreadRadius: 0,
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
                  "${widget.productDetails.productImage}",
                  height: 13.h,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.productDetails.productName}",
                        style: GoogleFonts.tajawal(
                          fontSize: 19.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(77, 79, 80, 1),
                        )),
                    Text("${widget.productDetails.category}",
                        style: GoogleFonts.tajawal(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(77, 79, 80, 1),
                        )),
                    Text("${widget.productDetails.quantity}",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(77, 79, 80, 1),
                        ))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, top: 1.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Quantity:",
                style: GoogleFonts.tajawal(
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(77, 79, 80, 1),
                ),
              ),
            ),
          ),
          ...List.generate(
            addedItemQuantityAvailable.length,
            (index) => Padding(
              padding: EdgeInsets.only(top: 1.h, left: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      selectedAddedItemQuantity =
                          addedItemQuantityAvailable[index];
                      setState(() {});
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 40.w,
                        decoration: BoxDecoration(
                          border: addedItemQuantityAvailable[index] ==
                                  selectedAddedItemQuantity
                              ? Border.all(color: circleColor)
                              : null,
                          borderRadius: BorderRadius.circular(70.sp),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/${30 * (index + 1)}ml.png",
                              scale: 4,
                              color: addedItemQuantityAvailable[index] ==
                                      selectedAddedItemQuantity
                                  ? circleColor
                                  : textColor,
                            ),
                            Text(
                              "${addedItemQuantityAvailable[index]}",
                              style: TextStyle(
                                color: addedItemQuantityAvailable[index] ==
                                        selectedAddedItemQuantity
                                    ? circleColor
                                    : textColor,
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
          ),
        ],
      ),
    );
  }
}
