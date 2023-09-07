import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/redeem/redeem.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedeemableProducts extends StatelessWidget {
  RedeemableProducts(
      {super.key,
      required this.detailsData,
      this.onTpWidget,
      required this.cartAddedProduct,
      required this.removeToCartTap});
  ProductModel detailsData;
  final Function? onTpWidget;
  final Function? removeToCartTap;
  List<CartProducts> cartAddedProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onTpWidget();
      },
      child: Container(
        //color:
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(4, 4),
              blurRadius: 6,
              spreadRadius: -2,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 1.h),
        child: ListTile(
          leading: Container(
              height: 18.h,
              width: 16.w,
              // color: Colors.blue,
              child: Image.asset(
                detailsData.productImage!,
                fit: BoxFit.contain,
              )),
          title: Text(
            detailsData.productName!,
            style: GoogleFonts.tajawal(
                fontSize: 17.sp,
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
                        detailsData.productDescription!,
                        style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
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
                          "\$${detailsData.productPrice}",
                          style: GoogleFonts.tajawal(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff424242)),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "\$${detailsData.productPrice! + 100}",
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff969696)),
                        ),
                      ],
                    ),
                    detailsData.productName == 'Adrianna Vineyard'
                        ? cartAddedProduct.any((element) =>
                                element.productModel == detailsData)
                            ? InkWell(
                                onTap: () {
                                  removeToCartTap!();
                                },
                                child: const Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  onTpWidget!();
                                },
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                ),
                              )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RedeemScreen(productDetails: detailsData),
                                ),
                              );
                            },
                            child: Container(
                              // height: 4.h,
                              // width: 30.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(116, 25, 41, 1),
                                    Color.fromRGBO(193, 19, 49, 1),
                                  ])),
                              margin: EdgeInsets.only(bottom: 0.5.h),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.w,
                                      right: 4.w,
                                      top: 0.5.h,
                                      bottom: 0.5.h),
                                  child: Text('Redeem',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
