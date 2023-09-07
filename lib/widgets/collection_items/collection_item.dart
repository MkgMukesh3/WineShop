import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CollectionItem extends StatelessWidget {
  CollectionItem(
      {super.key,
      required this.productModel,
      required this.onRedeemTap,
      required this.addToCartTap,
      required this.addedToCart,
      required this.removeToCartTap});

  ProductModel productModel;
  final Function onRedeemTap;
  final Function addToCartTap;
  final Function removeToCartTap;
  List<CartProducts> addedToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 6,
              spreadRadius: -2,
              color:
                  Color(0x29000000), // The opacity value is in hex (29 = 16%)
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset("${productModel.productImage}"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '''${productModel.productName}''',
                  style: GoogleFonts.tajawal(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff424242),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '''${productModel.type}''',
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff424242),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '''${productModel.quantity}''',
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff424242),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '''${productModel.validDate}''',
                    style: GoogleFonts.tajawal(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff424242),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      addedToCart.any(
                              (element) => element.productModel == productModel)
                          ? removeToCartTap()
                          : addToCartTap();
                    },
                    child: addedToCart.any(
                      (element) => element.productModel == productModel,
                    )
                        ? const Icon(
                            Icons.check_circle,
                            color: greenColor,
                          )
                        : const Icon(
                            Icons.add_circle,
                            color: Color.fromRGBO(196, 196, 196, 1),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      onRedeemTap();
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
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Redeem',
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
