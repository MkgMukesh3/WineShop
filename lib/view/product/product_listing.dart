import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Notifications/notificationTabBar.dart';
import 'package:mybar/view/Cart/cart.dart';
import 'package:mybar/widgets/product_wid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListing extends StatefulWidget {
  ProductListing({super.key});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  List categoryList = [
    {
      "name": "Whisky",
      "iconPath": "assets/icons/whisky.png",
    },
    {
      "name": "Wine",
      "iconPath": "assets/icons/wine.png",
    },
    {
      "name": "Beer",
      "iconPath": "assets/icons/beer.png",
    },
    {
      "name": "Coctails",
      "iconPath": "assets/icons/cocktail.png",
    },
    {
      "name": "Vodka",
      "iconPath": "assets/icons/vodka.png",
    },
    {
      "name": "Rum",
      "iconPath": "assets/icons/rum.png",
    },
    {
      "name": "Gin",
      "iconPath": "assets/icons/gin.png",
    },
  ];

  String selectedCategory = "Whisky";

  List<ProductModel> favoriteList = [];

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Image.asset(
                      "assets/icons/cart.png",
                      scale: 3,
                    ),
                  ),
                  addedToCart.length > 0
                      ? Positioned(
                          right: 4.7.w,
                          child: Image.asset(
                            "assets/icons/active.png",
                            scale: 5,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ));
              },
              child: Image.asset(
                "assets/icons/notification.png",
                scale: 3,
              ),
            ),
          ],
        ),
        surfaceTintColor: secondryColor,
        backgroundColor: secondryColor,
      ),
      body: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffEAEAEA),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: secondryColor,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xffACACAC),
                                    ),
                                    suffixIcon: Image.asset(
                                      "assets/icons/filter.png",
                                      scale: 3,
                                    ),
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      color: greyColor,
                                    ),
                                    hintText: "Search For Drinks...",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: Color(0xffD3D3D3)),
                                      right:
                                          BorderSide(color: Color(0xffD3D3D3)),
                                    ),
                                  ),
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/sort.png",
                                        scale: 3,
                                        color: Color(0xff4D4F50),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "Sort",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff4D4F50),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: Color(0xffD3D3D3)),
                                    ),
                                  ),
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.filter_alt,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "Filter",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff4D4F50),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    // color: Colors.red,
                    width: 100.w,
                    height: 11.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 3.w),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory =
                                      categoryList[index]["name"];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedCategory ==
                                          categoryList[index]["name"]
                                      ? primaryColor
                                      : secondryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.only(
                                    left: 4.w,
                                    right: 4.w,
                                    top: 1.h,
                                    bottom: 1.h),
                                margin: EdgeInsets.all(10),
                                child: SizedBox(
                                  height: 4.h,
                                  width: 5.w,
                                  child: Image.asset(
                                    "${categoryList[index]["iconPath"]}",
                                    color: selectedCategory ==
                                            categoryList[index]["name"]
                                        ? secondryColor
                                        : primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${categoryList[index]["name"]}",
                              style: GoogleFonts.roboto(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedCategory ==
                                        categoryList[index]["name"]
                                    ? primaryColor
                                    : Color(0xff7B7B7B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 3.8,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                      itemCount: products!
                          .where(
                              (element) => element.category == selectedCategory)
                          .toList()
                          .length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctx, index) {
                        return ProductWidget(
                          productDetails: products!
                              .where((element) =>
                                  element.category == selectedCategory)
                              .toList()[index],
                          cartAddedProduct: addedToCart,
                          index: index,
                          favoriteList: favoriteList,
                          addedToCartTap: () {
                            addedToCart.add(CartProducts(
                                length: 1,
                                productModel: products!
                                    .where((element) =>
                                        element.category == selectedCategory)
                                    .toList()[index]));
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
                                  element.productModel ==
                                  products!
                                      .where((element) =>
                                          element.category == selectedCategory)
                                      .toList()[index]),
                            );
                            print(addedToCart.length);
                            setState(() {});
                            _draggableScrollableController.isAttached
                                ? _draggableScrollableController.animateTo(1,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.ease)
                                : null;
                          },
                          addRemoveFav: () {
                            favoriteList.any((element) =>
                                    element ==
                                    products!
                                        .where((element) =>
                                            element.category ==
                                            selectedCategory)
                                        .toList()[index])
                                ? favoriteList.remove(products!
                                    .where((element) =>
                                        element.category == selectedCategory)
                                    .toList()[index])
                                : favoriteList.add(products!
                                    .where((element) =>
                                        element.category == selectedCategory)
                                    .toList()[index]);
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    // height: 20.h + (addedToCart.length * 4.h),
                    height: 7.h,
                  ),
                ],
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
                              padding: const EdgeInsets.only(top: 10.0),
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
                                padding: const EdgeInsets.only(top: 10.0),
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
                                                        length:
                                                            addedToCart[index]
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
                                            addedToCart[itemIndex] =
                                                CartProducts(
                                                    productModel:
                                                        addedToCart[index]
                                                            .productModel,
                                                    length: addedToCart[index]
                                                            .length! +
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
