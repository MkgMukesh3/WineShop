import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Bars/select_bars.dart';
import 'package:mybar/view/Cart/cart.dart';
import 'package:mybar/widgets/collection_items/collection_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../redeem/redeem.dart';

class Collections extends StatefulWidget {
  const Collections({super.key, required this.onBackTap});
  final Function onBackTap;

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        surfaceTintColor: secondryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            widget.onBackTap();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Collections",
                  style: GoogleFonts.roboto(
                    color: Color(0xff4D4F50),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 7,
                      spreadRadius: 0,
                      color: Color(
                        0x26000000,
                      ), // The opacity value is in hex (26 = 15%)
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Color(0xffD3D3D3)),
                              right: BorderSide(color: Color(0xffD3D3D3)),
                              bottom: BorderSide(color: Color(0xffD3D3D3))),
                        ),
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/sort.png",
                              scale: 3,
                              color: Color(0xff4D4F50),
                            ),
                            // Icon(Icons.swap_vert),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(
                                "Sort",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4D4F50),
                                ),
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
                            bottom: BorderSide(
                              color: Color(0xffD3D3D3),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CollectionItem(
                      productModel: products[index],
                      addedToCart: addedToCart,
                      addToCartTap: () async {
                        var resp = await TopUpBox(context, products[index]);
                        print("resp ${resp}");
                        if (resp == true) {
                          setState(() {});
                          _draggableScrollableController.isAttached
                              ? _draggableScrollableController.animateTo(1,
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.ease)
                              : null;
                        }
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
                      onRedeemTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Selectbars(productDetails: products[index])),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          if (addedToCart.length != 0)
            DraggableScrollableSheet(
              initialChildSize: 0.24 + (addedToCart.length * 0.05),
              maxChildSize: 0.24 + (addedToCart.length * 0.05),
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
                    topRight: Radius.circular(20),
                  ),
                ),
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

  TopUpBox(BuildContext context, ProductModel productModel) async {
    List<int> availableQuantity = [30, 60, 90];
    int selectedQuantity = 30;
    return showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
        return Dialog(
          backgroundColor: secondryColor,
          surfaceTintColor: secondryColor,
          child: Container(
            height: 42.h,
            width: MediaQuery.sizeOf(context).width > 728 ? 60.w : 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondryColor,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: secondryColor,
                      margin: EdgeInsets.only(
                        top: 2.h,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text(
                              "Top Up",
                              style: GoogleFonts.tajawal(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4F50)),
                            ),
                          ),
                          const Divider(
                            color: Color(0xffDADADA),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 15,
                      top: 10,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "${productModel.productImage}",
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                '''${productModel.productName}''',
                                style: GoogleFonts.tajawal(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff424242),
                                ),
                              ),
                              ...List.generate(
                                availableQuantity.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        selectedQuantity =
                                            availableQuantity[index];
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    // height: 3.5.h,
                                    // width: 18.w,
                                    decoration: BoxDecoration(
                                      border: selectedQuantity ==
                                              availableQuantity[index]
                                          ? Border.all(
                                              color: Color(0xffA1172F),
                                            )
                                          : null,
                                      borderRadius:
                                          BorderRadius.circular(70.sp),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 3.8.w,
                                          right: 3.8.w,
                                          top: 0.5.h,
                                          bottom: 0.5.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              index == 0
                                                  ? Image.asset(
                                                      "assets/images/30ml.png",
                                                      scale: 4,
                                                      color: Color(0xff7B7B7B),
                                                    )
                                                  : index == 1
                                                      ? Image.asset(
                                                          "assets/images/60ml.png",
                                                          scale: 4,
                                                          color:
                                                              Color(0xff7B7B7B),
                                                        )
                                                      : Image.asset(
                                                          "assets/images/90ml.png",
                                                          scale: 4,
                                                          color:
                                                              Color(0xff7B7B7B),
                                                        ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${availableQuantity[index]} ",
                                                    style: const TextStyle(
                                                      color: Color(0xff7B7B7B),
                                                    ),
                                                  ),
                                                  const Text(
                                                    "ml",
                                                    style: TextStyle(
                                                      color: Color(0xff7B7B7B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '''\$${productModel.productPrice! - ((2 - index) * 10)}''',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff424242),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    addedToCart.add(
                        CartProducts(length: 1, productModel: productModel));
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 0.4.h, left: 4.w, right: 4.w),
                    // height: 4.h,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(181, 29, 54, 1),
                        borderRadius: BorderRadius.circular(20.sp)),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.roboto(
                          fontSize: 15.sp,
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
        );
      }),
    );
  }
}
