import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PurchaseInformation extends StatefulWidget {
  const PurchaseInformation({super.key});

  @override
  State<PurchaseInformation> createState() => _PurchaseInformationState();
}

class _PurchaseInformationState extends State<PurchaseInformation> {
  List bannerList = [
    {"banner": "assets/images/products/product3.png"},
    {"banner": "assets/images/products/product2.png"},
    {"banner": "assets/images/products/product5.png"},
  ];

  List barList = [
    {
      "barName": "Chivas Regal 12",
    },
    {
      "barName": "Grgich Hills Estate",
    },
    {
      "barName": "Havana Club",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(35.sp),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 6,
                  blurRadius: 6,
                  offset: Offset(0, -4),
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
                      Text("Purchase Information",
                          style: GoogleFonts.roboto(
                              color: Color(0xff4D4F50),
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: Stack(
        children: [
          Column(
            children: [
              ListTile(
                title: Text('Purchase ID : 451681664168748184',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
                subtitle: Text('Date : 20 May 2020  7:00 PM',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500)),
                trailing: Image.asset(
                  "assets/images/pdf.png",
                  scale: 4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Items Purchased",
                        style: GoogleFonts.tajawal(
                            color: Color(0xff4D4F50),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500)),
                    Text("Total : 3",
                        style: GoogleFonts.tajawal(
                            color: Color(0xff4D4F50),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                width: 100.w,
                height: 22.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: barList.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
                      height: 17.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Color(0xFFffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 1.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 5  horizontally
                              3.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(
                            bannerList[index]['banner'],
                            height: 12.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(barList[index]['barName'],
                              style: GoogleFonts.tajawal(
                                  color: Color(0xff4D4F50),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text("Promocode Applied",
                  style: GoogleFonts.tajawal(
                      color: Color(0xff4D4F50),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500)),
              Container(
                height: 3.h,
                width: 34.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(181, 29, 54, 1))),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/percent.png",
                      fit: BoxFit.contain,
                    ),
                    Padding(padding: EdgeInsets.only(left: 2.w)),
                    Text("MO534V6",
                        style: GoogleFonts.tajawal(
                            color: Color.fromRGBO(77, 79, 80, 0.6),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Get \$99 Discount on your Purchase",
                  style: GoogleFonts.tajawal(
                      color: Color(0xff4D4F50),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.30,
              maxChildSize: 0.30,
              minChildSize: 0.06,
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
                      children: [
                        const Center(
                          child: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2.h,
                            left: 5.w,
                            right: 5.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sub Total",
                                  style: GoogleFonts.tajawal(
                                      color: Color(0xff4D4F50),
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500)),
                              Text("\$397",
                                  style: GoogleFonts.tajawal(
                                      color: Color(0xff4D4F50),
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.h,
                            left: 5.w,
                            right: 5.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount",
                                  style: GoogleFonts.tajawal(
                                      color: Color(0xff4D4F50),
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500)),
                              Text("\$99",
                                  style: GoogleFonts.tajawal(
                                      color: Color.fromRGBO(240, 17, 17, 1),
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.h,
                            left: 5.w,
                            right: 5.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Amount Paid",
                                  style: GoogleFonts.tajawal(
                                      color: Color.fromRGBO(161, 23, 47, 1),
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w500)),
                              Text("\$262",
                                  style: GoogleFonts.tajawal(
                                      color: Color.fromRGBO(161, 23, 47, 1),
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
        ],
      ),
    );
  }
}
