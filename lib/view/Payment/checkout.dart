import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Checkout extends StatefulWidget {
  Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List CheckoutList = [
    {
      "CheckoutName": "Credit / Debit Card",
      "CheckoutImage": "assets/images/credit.png",
      "Checkouticon": Icons.radio_button_checked_outlined,
    },
    {
      "CheckoutName": "Net Banking",
      "CheckoutImage": "assets/images/netbank.png",
      "Checkouticon": Icons.radio_button_checked_outlined,
    },
    {
      "CheckoutName": "PayPal",
      "CheckoutImage": "assets/images/paypal.png",
      "Checkouticon": Icons.radio_button_checked_outlined,
    },
    {
      "CheckoutName": "●●●● ●●●● ●●●●  5500",
      "CheckoutImage": "assets/images/Mastercard.png",
      "Checkouticon": Icons.radio_button_checked_outlined,
    },
    {
      "CheckoutName": "Add new card",
      "CheckoutImage": "assets/images/add.png",
    }
  ];

  TextEditingController _expiryDateController = TextEditingController();

  TextEditingController _cardnumberController = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: secondryColor,
        backgroundColor: secondryColor,
        title: Text("Checkout",
            style: GoogleFonts.roboto(
                color: Color(0xff4D4F50),
                fontSize: 19.sp,
                fontWeight: FontWeight.w500)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Select Payment Method",
                      style: GoogleFonts.tajawal(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 1,
                              color: Color(0xff969696),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: CheckoutList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ListTile(
                                leading: Container(
                                    height: 4.h,
                                    width: 10.w,
                                    child: Image.asset(
                                      CheckoutList[index]['CheckoutImage'],
                                      fit: BoxFit.contain,
                                    )),
                                title: Text(
                                  CheckoutList[index]['CheckoutName'],
                                  style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff4D4F50)),
                                ),
                                trailing: Icon(
                                  CheckoutList[index]["Checkouticon"],
                                  color: _selectedIndex == index
                                      ? primaryColor
                                      : Color(0xff969696),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedIndex =
                                        index; // Update the selected index
                                    print("index====${_selectedIndex}");
                                  });
                                },
                                //subtitle: Divider(),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, bottom: 5, top: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Enter Payment Details",
                        style: GoogleFonts.tajawal(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "CARDHOLDER NAME",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff969696)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Container(
                                //  height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffACACAC),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.w, bottom: 0, top: 0),
                                  child: TextField(
                                    //controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "JHON JOES D",
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.tajawal(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff969696),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 9.0, top: 5.0),
                                child: Text(
                                  "CARD NUMBER",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff969696)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 15),
                              child: Container(
                                //  height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffACACAC),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.w, bottom: 0, top: 0),
                                  child: TextField(
                                    maxLength: 19,
                                    controller: _cardnumberController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CreditCardNumberFormatter()
                                    ],
                                    decoration: InputDecoration(
                                      counterText: "",
                                      hintText: "●●●● ●●●● ●●●●  5500",
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.tajawal(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff969696),
                                      ),
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                            // color: Colors.deepOrange,
                                            height: 15,
                                            width: 47,
                                            child: Image.asset(
                                                "assets/images/Visa.png")),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 25.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "EXPIRY DATE",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff969696)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 28.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "CVV",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff969696)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 25.w,
                                    child: Container(
                                      // width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: Color(0xffACACAC),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: _expiryDateController,
                                          maxLength: 5,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CardMonthInputFormatter()
                                          ],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            counterText: "",
                                            border: InputBorder.none,
                                            hintText: "01 / 14",
                                            hintStyle: GoogleFonts.tajawal(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff969696),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 5.w,
                                  // ),
                                  SizedBox(
                                    width: 28.w,
                                    child: Container(
                                      // width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: Color(0xffACACAC),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: TextField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            border: InputBorder.none,
                                            hintStyle: GoogleFonts.tajawal(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff969696),
                                            ),
                                            hintText: "333",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
          DraggableScrollableSheet(
            //shouldCloseOnMinExtent: false,
            // expand: true,
            initialChildSize: 0.40,
            maxChildSize: 1,
            minChildSize: 0,
            builder: (context, controller) => Container(
              //  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 12),
                        child: Text(
                          "Order Summary",
                          style: GoogleFonts.tajawal(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3C3C3C)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Items",
                            style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C)),
                          ),
                          Text(
                            "\$397",
                            style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
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
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C)),
                          ),
                          Text(
                            "-\$99",
                            style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffF01111)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DottedLine(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.tajawal(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C)),
                          ),
                          Text(
                            "\$262",
                            style: GoogleFonts.tajawal(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff3C3C3C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Checkout()),
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff851729),
                                Color(0xffAF1731),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.6.h, bottom: 1.h),
                              child: Text(
                                "PLACE ORDER",
                                style: GoogleFonts.tajawal(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: secondryColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel Order",
                        style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFF1405)),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff4D4F50),
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/icons/homeicon.png',
              ),
              //  size: 24,
            ),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/icons/collection.png',
              ),
              // size: 24,
              color: Color(0xff4D4F50),
            ),
            label: 'Collections',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/icons/Promotion.png',
              ),
              //  size: 24,
              color: Color(0xff4D4F50),
            ),
            label: 'Promotion',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/icons/favicon.png',
              ),
              //  size: 25,
              color: Color(0xff4D4F50),
            ),
            label: 'Favourtites',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        currentIndex: 0,
        fixedColor: primaryColor,
        backgroundColor: Colors.white,
        // selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

void _onItemTapped(int index) {}

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < enteredData.length; i++) {
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        // add space after 4th digit
        buffer.write(' ');
      }
    }

    return TextEditingValue(
        text: buffer.toString(), // final generated credit card number
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
