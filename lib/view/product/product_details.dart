import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Bars/bar_details.dart';
import 'package:mybar/view/Cart/cart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.productDetails});
  ProductModel productDetails;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool bootomsheet = false;

  final List<String> barstatus = [
    "Open",
    "Closed",
    "Open",
  ];

  final List<String> barkm = [
    "2.8Km",
    "4Km",
    "4Km",
  ];

  final List<String> barname = [
    "Charlie's Bar",
    "New town",
    "New town",
  ];

  final List<String> barlocation = [
    "St 07, Buliding",
    "St 07, Buliding",
    "St 07, Buliding",
  ];

  final List<String> imagePaths = [
    'assets/images/barimage.png',
    'assets/images/barimage.png',
    'assets/images/barimage.png',
    // Add all the image paths here
  ];
  final List<int> quantityProducts = [500, 750, 1000];
  int selectedQuantity = 500;
  bool isFaourite = false;

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: secondryColor,
        backgroundColor: secondryColor,
        actions: [],
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
                          child: Icon(
                            Icons.circle,
                            color: greenColor,
                            size: 12,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      //backgroundColor: Colors.white,
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2.h),
                              bottomRight: Radius.circular(2.h),
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${widget.productDetails.productName}",
                                        style: GoogleFonts.roboto(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 14.h),
                                              child: Text(
                                                "\$${widget.productDetails.productPrice! + selectedQuantity / 10}",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: primaryColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: 10.h, top: 1.h),
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          "${widget.productDetails.productDescription}",
                                          style: GoogleFonts.tajawal(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 22.h,
                                            child: Image.asset(
                                              "assets/images/pricebg.png",
                                              fit: BoxFit.contain,
                                              scale: 5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "You Save: \$100.00",
                                              style: GoogleFonts.roboto(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    // color: Colors.deepPurple,
                                    height: 18.h,
                                    width: 17.h,
                                    child: Image.asset(
                                      "${widget.productDetails.productImage}",
                                      fit: BoxFit.contain,
                                      scale: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.2.h,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 5.w, bottom: 2.w),
                                width: double.infinity,
                                child: Text(
                                  "Quantity:",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ...List.generate(
                                    quantityProducts.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedQuantity =
                                              quantityProducts[index];
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: selectedQuantity ==
                                                      quantityProducts[index]
                                                  ? primaryColor
                                                  : greyColor,
                                              width: 1,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 17,
                                              right: 17.0,
                                              top: 3,
                                              bottom: 1),
                                          child: Text(
                                            "${quantityProducts[index]}",
                                            style: GoogleFonts.tajawal(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: selectedQuantity ==
                                                      quantityProducts[index]
                                                  ? primaryColor
                                                  : greyColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(15),
                                  //     border: Border.all(
                                  //       color: Color(0xff7B7B7B),
                                  //       width: 1,
                                  //     ),
                                  //   ),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(
                                  //         left: 17,
                                  //         right: 17.0,
                                  //         top: 3,
                                  //         bottom: 1),
                                  //     child: Text(
                                  //       "750ml",
                                  //       style: GoogleFonts.tajawal(
                                  //         fontSize: 14.sp,
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Color(0xff7B7B7B),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       border: Border.all(
                                  //         color: Color(0xff7B7B7B),
                                  //         width: 1,
                                  //       )),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(
                                  //         left: 17,
                                  //         right: 17.0,
                                  //         top: 3,
                                  //         bottom: 1),
                                  //     child: Text(
                                  //       "750ml",
                                  //       style: GoogleFonts.tajawal(
                                  //         fontSize: 14.sp,
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Color(0xff7B7B7B),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3.0, right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff3C3C3C),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 0.5.h,
                                      width: 2.5.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3.0, right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff696969),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 0.5.h,
                                      width: 2.5.h,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff696969),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 0.5.h,
                                    width: 2.5.h,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 3.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    addedToCart.any((element) =>
                                            element.productModel ==
                                            widget.productDetails)
                                        ? null
                                        : addedToCart.add(
                                            CartProducts(
                                              length: 1,
                                              productModel:
                                                  widget.productDetails,
                                            ),
                                          );
                                    setState(() {});

                                    _draggableScrollableController.isAttached
                                        ? _draggableScrollableController
                                            .animateTo(1,
                                                duration:
                                                    Duration(milliseconds: 800),
                                                curve: Curves.ease)
                                        : null;
                                  },
                                  child: Container(
                                    width: 20.h,
                                    height: 4.5.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff88182B),
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, top: 4),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "ADD TO CART",
                                            style: GoogleFonts.tajawal(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          width: 5.5.h,
                                          height: 5.h,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffD46679),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              bottomLeft: Radius.circular(50),
                                              bottomRight: Radius.circular(45),
                                              topRight: Radius.circular(45),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: Image.asset(
                                              "assets/icons/addcard.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFaourite = !isFaourite;
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    size: 28,
                                    color: isFaourite ? redColor : greyColor,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                "Chivas Regal 12 years is a  full-flavoured, rich and sophisticated Cuban rum with a high degree of class.   deservedly popular rum.",
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Redeemable in Bars",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Select your nearest bar and redeem your drink",
                                style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffACACAC),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: imagePaths.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Bar_Details(),
                                ));
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // Divider(
                                  //   color: Color(0xffACACAC),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              width: 15.h,
                                              child: Image.asset(
                                                  imagePaths[index])),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Container(
                                            width: 30.w,
                                            //  color: Colors.lightGreenAccent,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/barname.png",
                                                      scale: 3,
                                                    ),
                                                    // SizedBox(
                                                    //   width: 1.h,
                                                    // ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 0.0,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            barname[index],
                                                            style: GoogleFonts
                                                                .tajawal(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff030303),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/barlocation.png",
                                                      scale: 3,
                                                    ),
                                                    Text(
                                                      barlocation[index],
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff4D4F50),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/barkm.png",
                                                      scale: 3,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 38.0),
                                                      child: Text(
                                                        barkm[index],
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff4D4F50),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 10.h,
                                        padding: EdgeInsets.only(right: 3.w),
                                        // width: 16.w,
                                        child: Center(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.fiber_manual_record,
                                              color:
                                                  barstatus[index] == "Closed"
                                                      ? Color(0xffFF2121)
                                                      : Color(0xff38C720),
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              barstatus[index],
                                              style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    barstatus[index] == "Closed"
                                                        ? Color(0xffFF2121)
                                                        : Color(0xff38C720),
                                              ),
                                            ),
                                          ],
                                        )),
                                        //color: Colors.blueGrey,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Color(0xffACACAC),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  )
                ],
              ),
            ),
            if (addedToCart.length != 0)
              DraggableScrollableSheet(
                  initialChildSize: 0.22 + (addedToCart.length * 0.045),
                  maxChildSize: 0.22 + (addedToCart.length * 0.045),
                  minChildSize: 0.07,
                  controller: _draggableScrollableController,
                  builder: (context, controller) {
                    return Container(
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
                    );
                  }),
          ],
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
  }
}
