import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/widgets/products/drinks_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/common.dart';
import '../Cart/cart.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  List<ProductModel> listOfFavouriteDrinks = [];
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  void initState() {
    super.initState();
    listOfFavouriteDrinks.addAll(products);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 100.w,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listOfFavouriteDrinks!.length,
              itemBuilder: (context, index) {
                return DrinksWidget(
                  productModel: listOfFavouriteDrinks![index],
                  removeFromFavourite: () {
                    listOfFavouriteDrinks!
                        .remove(listOfFavouriteDrinks![index]);
                    setState(
                      () {},
                    );
                  },
                  addedToCartTap: () {
                    print("cdxb");
                    addedToCart.any((element) =>
                            element.productModel ==
                            listOfFavouriteDrinks[index])
                        ? null
                        : addedToCart.add(CartProducts(
                            length: 1,
                            productModel: listOfFavouriteDrinks![index]));
                    setState(() {});
                    _draggableScrollableController.isAttached
                        ? _draggableScrollableController.animateTo(1,
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease)
                        : null;
                  },
                );
              },
            ),
          ),
          if (addedToCart.length != 0)
            DraggableScrollableSheet(
              initialChildSize: 0.24 + (addedToCart.length * 0.045),
              maxChildSize: 0.24 + (addedToCart.length * 0.045),
              minChildSize: 0.07,
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
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              " ${addedToCart.length} Items selected add to cart ",
                              style: GoogleFonts.tajawal(
                                  fontSize: 15.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffACACAC)),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          ...List.generate(addedToCart.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Row(
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
                              ),
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
                                  builder: (context) =>
                                      Cart(addedToCart: addedToCart),
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
                                  padding:
                                      EdgeInsets.only(top: 1.6.h, bottom: 1.h),
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
    );
  }
}
