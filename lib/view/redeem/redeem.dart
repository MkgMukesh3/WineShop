import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Bars/bar_listing.dart';
import 'package:mybar/view/Bars/select_bars.dart';
import 'package:mybar/view/redeem/redeemDetails.dart';
import 'package:mybar/widgets/products/redeem_added_item.dart';

import 'package:mybar/widgets/products/reedem_available_items.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class RedeemScreen extends StatefulWidget {
  RedeemScreen({super.key, required this.productDetails});
  ProductModel productDetails;

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  String foos = 'Choose Mixer';

  int _selectedIndex = -1;
  final List<int> quantityProducts = [30, 60, 90];
  int selectedQuantity = 30;
  List<CartProducts> addedToCart = [];
  void initState() {
    super.initState();
    addedToCart
        .add(CartProducts(length: 1, productModel: widget.productDetails));
    setState(() {});
  }

  List<ProductModel> addedMoreItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.sp),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(3, 3),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: secondryColor,
            surfaceTintColor: secondryColor,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Redeem",
                        style: GoogleFonts.roboto(
                            color: Color(0xff4D4F50),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0,
                        0.16), // Equivalent to #000000 with 16% opacity
                    offset: Offset(3, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            "New Town Bar",
                            style: GoogleFonts.tajawal(
                                fontSize: 19.5.sp,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(66, 66, 66, 1)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            'Odeon Towers Extension Rooftop, Singapore',
                            style: GoogleFonts.tajawal(
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(66, 66, 66, 1)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Selectbars(
                                      productDetails: widget.productDetails)),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 4.w, top: 2.h),
                            child: Image.asset(
                              "assets/images/selectBar.png",
                              height: 20.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/helena2.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
              width: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0,
                        0.16), // Equivalent to #000000 with 16% opacity
                    offset: Offset(3, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(left: 10.w, top: 3.h),
                          child: Image.asset(
                            "${widget.productDetails.productImage}",
                            height: 18.h,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.productDetails.productName}",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 19.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(77, 79, 80, 1),
                                  )),
                              Text(
                                  "${widget.productDetails.productDescription}",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(77, 79, 80, 1),
                                  )),
                              Text("${widget.productDetails.quantity}",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(77, 79, 80, 1),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w, top: 1.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Select Quantity:",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(77, 79, 80, 1),
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          quantityProducts.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedQuantity = quantityProducts[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: selectedQuantity ==
                                            quantityProducts[index]
                                        ? circleColor
                                        : Colors.white,
                                    width: 1,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 17, right: 17.0, top: 3, bottom: 1),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/${quantityProducts[index]}ml.png",
                                      scale: 4,
                                      color: selectedQuantity ==
                                              quantityProducts[index]
                                          ? circleColor
                                          : Color(0xff4D4F50),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${quantityProducts[index]}",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: selectedQuantity ==
                                                quantityProducts[index]
                                            ? circleColor
                                            : Color(0xff4D4F50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w, top: 2.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("No of glasses",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(77, 79, 80, 1),
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 5.h,
                        width: 50.w,
                        //color: Colors.cyan,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                int itemIndex = await addedToCart.indexWhere(
                                    (element) =>
                                        element.productModel ==
                                        widget.productDetails);
                                addedToCart[0].length != 1
                                    ? addedToCart[itemIndex] = CartProducts(
                                        productModel: widget.productDetails,
                                        length: addedToCart[0].length! - 1)
                                    : null;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: circleColor,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${addedToCart[0].length}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: circleColor,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            GestureDetector(
                              onTap: () async {
                                int itemIndex = await addedToCart.indexWhere(
                                    (element) =>
                                        element.productModel ==
                                        addedToCart[0].productModel);
                                addedToCart[itemIndex] = CartProducts(
                                    productModel: addedToCart[0].productModel,
                                    length: addedToCart[0].length! + 1);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: circleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 1.h, left: 4.w, right: 4.w, bottom: 2.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                          title: Text(
                            (this.foos),
                            style: GoogleFonts.tajawal(
                                color: Color(0xff4D4F50),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600),
                            // overflow: TextOverflow.ellipsis,
                          ),
                          onExpansionChanged: (value) {},
                          children: <Widget>[
                            ListView.builder(
                                padding: EdgeInsets.all(0),
                                // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: mixturelist.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        height: 1,
                                        color: greyColor,
                                      ),
                                      Container(
                                          child: _selectedIndex == index
                                              ? ListTile(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  leading: Container(
                                                    padding: EdgeInsets.only(
                                                        right: 3.w),
                                                    width: 1.5.w,
                                                    color: Color.fromRGBO(
                                                        171, 23, 49, 1),
                                                  ),
                                                  title: Text(
                                                    mixturelist[index]['Name'],
                                                    style: GoogleFonts.tajawal(
                                                        color:
                                                            Color(0xff4D4F50),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : ListTile(
                                                  title: Text(
                                                    mixturelist[index]['Name'],
                                                    style: GoogleFonts.tajawal(
                                                        color:
                                                            Color(0xff4D4F50),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  onTap: () {
                                                    if (mixturelist[index]
                                                            ['Name'] ==
                                                        "Choose Mixer 1") {
                                                      setState(() {
                                                        _selectedIndex = index;
                                                        this.foos =
                                                            "Choose Mixer 1";
                                                      });
                                                    } else if (mixturelist[
                                                            index]['Name'] ==
                                                        "Choose Mixer 2") {
                                                      setState(() {
                                                        _selectedIndex = index;
                                                        this.foos =
                                                            "Choose Mixer 2";
                                                      });
                                                    } else if (mixturelist[
                                                            index]['Name'] ==
                                                        "Choose Mixer 3") {
                                                      setState(() {
                                                        _selectedIndex = index;
                                                        this.foos =
                                                            "Choose Mixer 3";
                                                      });
                                                    }
                                                  })),
                                    ],
                                  );
                                })
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(
              addedMoreItems.length,
              (index) => RedeemAddedItems(
                productDetails: addedMoreItems[index],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0,
                        0.16), // Equivalent to #000000 with 16% opacity
                    offset: Offset(3, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w, top: 2.h),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            var respOfDialog = await Dailogbox();
                            if (respOfDialog == true) {
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.add_circle),
                          color: Color.fromRGBO(147, 147, 147, 1),
                          iconSize: 23.sp,
                        ),
                        Text("Add More Items",
                            style: GoogleFonts.tajawal(
                              fontSize: 18.5.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(147, 147, 147, 1),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 3.h),
                    child: Text("Table No:",
                        style: GoogleFonts.tajawal(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(77, 79, 80, 1),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 1.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffACACAC)),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Table No",
                        contentPadding: EdgeInsets.only(
                          left: 5.w,
                        ),
                        hintStyle: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(218, 218, 218, 1),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RedeemDetails(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 6.w, right: 6.w, top: 3.h, bottom: 2.h),
                      height: 6.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(133, 23, 41, 1),
                            Color.fromRGBO(175, 23, 49, 1)
                          ]),
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Center(
                        child: Text(
                          "REDEEM",
                          style: GoogleFonts.roboto(
                            fontSize: 16.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }

  Dailogbox() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: secondryColor,
            surfaceTintColor: secondryColor,
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: secondryColor,
              ),
              child: Column(
                children: [
                  Container(
                    color: secondryColor,
                    margin: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text(
                            "Add More Items",
                            style: GoogleFonts.tajawal(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(77, 79, 80, 1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Icon(Icons.close)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RedeemAvailableItems(
                            detailsData: products[index],
                            addedMoreItems: addedMoreItems,
                            onAddTap: () async {
                              setState(
                                () {
                                  addedMoreItems.add(products[index]);
                                },
                              );
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
