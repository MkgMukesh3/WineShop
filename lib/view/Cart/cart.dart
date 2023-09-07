import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Payment/checkout.dart';
import 'package:mybar/view/product/product_listing.dart';
import 'package:mybar/widgets/product_wid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Cart extends StatefulWidget {
  Cart({super.key, required this.addedToCart});

  List<CartProducts> addedToCart;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void initState() {
    super.initState();

    subTotal();
  }

  int Subtotal = 0;
  subTotal() async {
    Subtotal = 0;
    widget.addedToCart.forEach((element) {
      int priceOfProduct =
          element.length! * element.productModel!.productPrice!;
      Subtotal += priceOfProduct;
    });
    setState(() {});
  }

  // List cartList = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.sp),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(4, 4),
                blurRadius: 6,
                spreadRadius: -2,
              )
            ],
          ),
          child: AppBar(
            surfaceTintColor: secondryColor,
            backgroundColor: secondryColor,
            title: Text("My Cart",
                style: GoogleFonts.roboto(
                    color: Color(0xff4D4F50),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: widget.addedToCart.length != 0
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 8),
                          child: Text(
                            "${widget.addedToCart.length} items in your cart",
                            style: GoogleFonts.tajawal(
                              color: blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: widget.addedToCart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Slidable(
                            endActionPane: ActionPane(
                              // closeThreshold: 1,
                              // extentRatio: 5,
                              dragDismissible: true,
                              key: const ValueKey(0),
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  spacing: 5,
                                  autoClose: true,
                                  borderRadius: BorderRadius.circular(25),
                                  flex: 1,

                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  //   borderRadius: BorderRadius.circular(10),
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  onPressed: (BuildContext context) {},
                                ),
                              ],
                            ),
                            // motion: const ScrollMotion(),

                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Container(
                                //color:
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(
                                          0x00000029), // Equivalent to #00000029
                                      offset: Offset(4, 4),
                                      blurRadius: 6,
                                      spreadRadius: -2,
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Container(
                                      height: 15.h,
                                      width: 15.w,
                                      // color: Colors.blue,
                                      child: Image.asset(
                                        widget.addedToCart[index].productModel!
                                            .productImage!,
                                        fit: BoxFit.contain,
                                      )),
                                  title: Text(
                                    widget.addedToCart[index].productModel!
                                        .productName!,
                                    style: GoogleFonts.tajawal(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4D4F50)),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                widget
                                                    .addedToCart[index]
                                                    .productModel!
                                                    .productDescription!,
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 14.sp,
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
                                            children: [
                                              Text(
                                                "\$${widget.addedToCart[index].productModel!.productPrice}",
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff424242)),
                                              ),
                                              SizedBox(
                                                width: 2.h,
                                              ),
                                              Text(
                                                "\$ ${widget.addedToCart[index].productModel!.productPrice! + 100}",
                                                style: GoogleFonts.roboto(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff969696)),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  trailing: Container(
                                      height: 4.h,
                                      width: 10.h,
                                      //color: Colors.cyan,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              int itemIndex = await widget
                                                  .addedToCart
                                                  .indexWhere((element) =>
                                                      element.productModel ==
                                                      widget.addedToCart[index]
                                                          .productModel);
                                              widget.addedToCart[index]
                                                          .length !=
                                                      1
                                                  ? widget.addedToCart[
                                                          itemIndex] =
                                                      CartProducts(
                                                          productModel: widget
                                                              .addedToCart[
                                                                  index]
                                                              .productModel,
                                                          length: widget
                                                                  .addedToCart[
                                                                      index]
                                                                  .length! -
                                                              1)
                                                  : widget.addedToCart.remove(
                                                      widget.addedToCart[
                                                          itemIndex]);
                                              subTotal();
                                            },
                                            child: Icon(
                                              Icons.remove_circle,
                                              size: 20.sp,
                                              color: Color(0xffA1172F),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: Text(
                                                "${widget.addedToCart[index].length}",
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffA1172F)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              int itemIndex = await widget
                                                  .addedToCart
                                                  .indexWhere((element) =>
                                                      element.productModel ==
                                                      widget.addedToCart[index]
                                                          .productModel);
                                              widget.addedToCart[itemIndex] =
                                                  CartProducts(
                                                      productModel: widget
                                                          .addedToCart[index]
                                                          .productModel,
                                                      length: widget
                                                              .addedToCart[
                                                                  index]
                                                              .length! +
                                                          1);
                                              subTotal();
                                            },
                                            child: Icon(
                                              Icons.add_circle,
                                              size: 20.sp,
                                              color: Color(0xffA1172F),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Cart Is Empty",
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Looks like you haven't add any item to your cart yet!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductListing()),
                              );
                            },
                            child: Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "SHOP NOW",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: secondryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          if (widget.addedToCart.length != 0)
            DraggableScrollableSheet(
              initialChildSize: 0.43,
              maxChildSize: 0.43,
              minChildSize: 0.06,
              snap: true,
              builder: (context, controller) {
                return Container(
                  decoration: const BoxDecoration(
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
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(
                      controller: controller,
                      shrinkWrap: true,
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                          size: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 1.h, bottom: 1.h, right: 8.w, left: 8.w),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              filled: true,
                              fillColor: Color(0xffDADADA),
                              hintStyle: GoogleFonts.tajawal(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffACACAC)),
                              // border: InputBorder.none,

                              hintText: 'Promocode',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                    width: 0, color: Color(0xffACACAC)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                    width: 0, color: Color(0xffACACAC)),
                              ),

                              suffixIcon: Container(
                                width: 40.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(
                                          0xFFA0182F), // #A0182F in RGBA format
                                      Color(
                                          0xFF751A2A) // #751A2A in RGBA format
                                    ],
                                    stops: [
                                      0.255,
                                      0.6908
                                    ], // Adjust these values to set the color stop percentages
                                    transform: GradientRotation(
                                        253.2), // Rotate the gradient to 253.2 degrees
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.h,
                                      bottom: 1.h,
                                      left: 14.w,
                                      right: 14.w),
                                  child: Center(
                                    child: Text(
                                      "Apply",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/gift.png",
                              scale: 3.8,
                            ),
                            SizedBox(
                              width: 0.5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Do you havde any promocode? ",
                                style: GoogleFonts.tajawal(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffACACAC)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3C3C3C)),
                              ),
                              Text(
                                "\$${Subtotal}",
                                style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3C3C3C)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff3C3C3C)),
                              ),
                              Text(
                                "-\$99",
                                style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffF01111)),
                              ),
                            ],
                          ),
                        ),
                        // (
                        //   color: Color(0xffACACAC),
                        //   thickness: 2,
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Payable",
                                style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff050505)),
                              ),
                              Text(
                                "\$${Subtotal - 99}",
                                style: GoogleFonts.tajawal(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff050505)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout()),
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
                                      EdgeInsets.only(top: 1.3.h, bottom: 1.h),
                                  child: Text(
                                    "CHECKOUT",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: secondryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                );
              },
            ),
        ],
      ),
    );
  }
}

void _onItemTapped(int index) {}
