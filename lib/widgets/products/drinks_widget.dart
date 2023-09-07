import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrinksWidget extends StatelessWidget {
  DrinksWidget(
      {super.key,
      required this.productModel,
      required this.removeFromFavourite,
      required this.addedToCartTap});
  ProductModel productModel;
  Function removeFromFavourite;
  Function addedToCartTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
        height: 18.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 6,
                color:
                    Color(0x29000000), // The opacity value is in hex (29 = 16%)
              ),
              BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 6,
                color: Color(0x29000000),
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productModel.productName!,
                          style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(66, 66, 66, 1)),
                        ),
                        Text(
                          productModel.productDescription!,
                          style: GoogleFonts.tajawal(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(66, 66, 66, 1)),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${productModel.productPrice}",
                              style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(66, 66, 66, 1)),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "\$199",
                              style: GoogleFonts.roboto(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(150, 150, 150, 1)),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "Save \$100..",
                              style: GoogleFonts.tajawal(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(181, 29, 54, 1)),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            addedToCartTap();
                          },
                          child: Container(
                            width: 35.w,
                            margin: EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(181, 29, 54, 1),
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style: GoogleFonts.roboto(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
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
                  flex: 2,
                  child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFffffff),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-4, 2),
                            blurRadius: 6,
                            color: Color(
                                0x29000000), // The opacity value is in hex (29 = 16%)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(productModel.productImage!),
                      )),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  removeFromFavourite();
                },
                child: Icon(
                  Icons.favorite,
                  color: redColor,
                ),
              ),
            )
          ],
        ));
  }
}
