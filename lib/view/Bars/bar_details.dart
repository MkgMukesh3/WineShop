import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/common.dart';
import '../../constant.dart';
import '../../model/product_model.dart';
import '../../widgets/products/redeemable_products.dart';
import '../Cart/cart.dart';

class Bar_Details extends StatefulWidget {
  const Bar_Details({super.key});

  @override
  State<Bar_Details> createState() => _Bar_DetailsState();
}

class _Bar_DetailsState extends State<Bar_Details> {
  bool bootomsheet = false;
  List bannerList = [
    {"banner": "assets/images/barbanner.png"},
    {"banner": "assets/images/barbanner.png"},
  ];

  bool isFaourite = false;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('assets/images/helena.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 5.w, top: 5.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.arrow_back,
                              color: secondryColor,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5.w, top: 5.h),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              isFaourite = !isFaourite;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.favorite,
                              color: isFaourite ? redColor : secondryColor,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 5.w, top: 21.h),
                          height: 3.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(79, 234, 54, 1),
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: Center(
                            child: Text(
                              'OPEN',
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.h),
                        height: 31.3.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.sp),
                            boxShadow: [BoxShadow(blurRadius: 5.sp)]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 3.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "The Luxary Bar",
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff424242),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 30.w),
                                      child: Icon(
                                        Icons.directions_walk,
                                        color: Color.fromRGBO(193, 19, 49, 1),
                                        size: 19.sp,
                                      )
                                      // ImageIcon(
                                      //   AssetImage('assets/images/redperson.png'),
                                      //   size: 18.sp,
                                      // )
                                      ),
                                  Container(
                                      margin: EdgeInsets.only(right: 5.w),
                                      child: Text('2.8 km'))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Color.fromRGBO(193, 19, 49, 1)),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'The Luxary Bar, St.007 Odeon Tower, Singapore.  ',
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff424242),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 1.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Image(
                                  image: AssetImage('assets/images/rating.png'),
                                  height: 4.h,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 1.h),
                              child: Text(
                                  'Diam, at non ut justo, elit. Nascetur urna dolor, cras massa. Tristique aliquam ultrices vulputate mus aliquet. Mattis nam nunc, pretium nunc integer. Malesuada nisl a, netus ac orci.',
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff424242),
                                  )),
                            ),
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6.w, top: 2.h),
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/icons/call.png',
                                  ),
                                  color: Color.fromRGBO(193, 19, 49, 1),
                                  size: 17.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w, top: 2.h),
                                child: Text('562-54664-51',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff424242),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.w, top: 3.h),
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/menu.png',
                                  ),
                                  height: 3.h,
                                ),
                              )
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Special Offers",
                          style: GoogleFonts.tajawal(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff424242),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 13.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 2,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 85.w,
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            bannerList[index]['banner'],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.w, top: 4.h),
                    child: Text(
                      'Redeemable Products',
                      style: GoogleFonts.roboto(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff424242),
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 8.h),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return RedeemableProducts(
                          detailsData: products[index],
                          cartAddedProduct: addedToCart,
                          onTpWidget: () {
                            addedToCart.add(CartProducts(
                                length: 1, productModel: products![index]));
                            print(addedToCart.length);
                            setState(() {});
                            _draggableScrollableController.isAttached
                                ? _draggableScrollableController.animateTo(1,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.ease)
                                : null;
                          },
                          removeToCartTap: () {
                            addedToCart.removeAt(
                              addedToCart.indexWhere((element) =>
                                  element.productModel == products[index]),
                            );
                            print(addedToCart.length);
                            setState(() {});
                            _draggableScrollableController.isAttached
                                ? _draggableScrollableController.animateTo(1,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.ease)
                                : null;
                          },
                        );
                      }),
                ],
              ),
            ),
            if (addedToCart.length != 0)
              DraggableScrollableSheet(
                initialChildSize: 0.20 + (addedToCart.length * 0.045),
                maxChildSize: 0.20 + (addedToCart.length * 0.045),
                minChildSize: 0.06,
                snap: true,
                controller: _draggableScrollableController,
                builder: (context, controller) => Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(
                    controller: controller,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                " ${addedToCart.length} Items selected add to cart ",
                                style: GoogleFonts.tajawal(
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffACACAC)),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            ...List.generate(addedToCart.length, (index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${addedToCart[index].productModel!.productName}",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blackColor),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          int itemIndex = await addedToCart
                                              .indexWhere((element) =>
                                                  element.productModel ==
                                                  addedToCart[index]
                                                      .productModel);
                                          addedToCart[index].length != 1
                                              ? addedToCart[itemIndex] =
                                                  CartProducts(
                                                      productModel:
                                                          addedToCart[index]
                                                              .productModel,
                                                      length: addedToCart[index]
                                                              .length! -
                                                          1)
                                              : addedToCart.remove(
                                                  addedToCart[itemIndex]);
                                          setState(() {});
                                        },
                                        child: Icon(Icons.remove_circle),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "${addedToCart[index].length}",
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          int itemIndex = await addedToCart
                                              .indexWhere((element) =>
                                                  element.productModel ==
                                                  addedToCart[index]
                                                      .productModel);
                                          addedToCart[itemIndex] = CartProducts(
                                              productModel: addedToCart[index]
                                                  .productModel,
                                              length:
                                                  addedToCart[index].length! +
                                                      1);
                                          setState(() {});
                                        },
                                        child: Icon(Icons.add_circle),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cart(
                                      addedToCart: addedToCart,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.6.h, bottom: 1.h),
                                    child: Text(
                                      "VIEW CART",
                                      style: GoogleFonts.tajawal(
                                        textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: secondryColor,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
