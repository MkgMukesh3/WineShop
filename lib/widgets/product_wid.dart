import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/product/product_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {super.key,
      required this.productDetails,
      required this.index,
      required this.addedToCartTap,
      required this.cartAddedProduct,
      required this.favoriteList,
      required this.addRemoveFav,
      required this.removeToCartTap});
  ProductModel productDetails;
  List<CartProducts> cartAddedProduct;
  int index;
  Function addedToCartTap;
  Function addRemoveFav;
  Function removeToCartTap;
  List<ProductModel> favoriteList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(productDetails: productDetails)),
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 4,
                  spreadRadius: -2,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                Image.asset(
                  "${productDetails.productImage}",
                  scale: 5,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "${productDetails.productName}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                Text(
                  "${productDetails.productDescription}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                Text(
                  "\$${productDetails.productPrice}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          top: 2.5.h,
          child: favoriteList.any((element) => element == productDetails)
              ? GestureDetector(
                  onTap: () {
                    addRemoveFav();
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: redColor,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    addRemoveFav();
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Color(0xffDADADA),
                  ),
                ),
        ),
        Positioned(
          left: 5.w,
          top: 2.5.h,
          child: Text(
            "150 ml",
            style: GoogleFonts.roboto(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
          ),
        ),
        cartAddedProduct
                .any((element) => element.productModel == productDetails)
            ? Positioned(
                right: 5.w,
                bottom: 2.5.h,
                child: GestureDetector(
                  onTap: () {
                    removeToCartTap();
                  },
                  child: const Icon(
                    Icons.check_circle,
                    color: greenColor,
                  ),
                ),
              )
            : Positioned(
                right: 5.w,
                bottom: 2.5.h,
                child: GestureDetector(
                  onTap: () {
                    addedToCartTap();
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Color(0xffDADADA),
                  ),
                ),
              ),
      ],
    );
  }
}
