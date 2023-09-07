import 'package:flutter/material.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeProductWidget extends StatelessWidget {
  HomeProductWidget(
      {super.key,
      required this.productDetails,
      required this.onTapProducts,
      required this.addRemoveFav,
      required this.drinksfavoriteList});
  ProductModel productDetails;
  final Function onTapProducts;
  Function addRemoveFav;
  List<ProductModel> drinksfavoriteList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapProducts();
      },
      child: Container(
        padding: EdgeInsets.only(left: 3.w),
        child: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              height: 24.h,
              width: MediaQuery.sizeOf(context).width > 728 ? 35.w : 38.w,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: Color(int.parse("0xff${productDetails.topColor!}")),
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            ),
            Container(
              height: 24.h,
              width: MediaQuery.sizeOf(context).width > 728 ? 35.w : 38.w,
              margin: EdgeInsets.only(bottom: 6.5.h),
              child: Image.asset(
                "${productDetails.productImage}",
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width > 728 ? 35.w : 38.w,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            addRemoveFav();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: drinksfavoriteList.contains(productDetails)
                                ? Icon(
                                    Icons.favorite,
                                    color: redColor,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: secondryColor,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "300ml",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Align(
                // alignment: Alignment.bottomCenter,
                child: Container(
                    width: MediaQuery.sizeOf(context).width > 728 ? 35.w : 38.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/images/wave.png",
                      ),
                      colorFilter: ColorFilter.mode(
                          Color(
                              int.parse("0xff${productDetails.bottomColor!}")),
                          BlendMode.srcIn),
                      fit: BoxFit.fill,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${productDetails.productName}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.4.sp),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Saving: \$19",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.4.sp,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "\$${productDetails.productPrice}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.4.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
