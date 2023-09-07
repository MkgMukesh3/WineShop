import 'package:control_style/decorated_input_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/profile/faqs_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant.dart';

class HElpSupport extends StatefulWidget {
  const HElpSupport({super.key});

  @override
  State<HElpSupport> createState() => _HElpSupportState();
}

class _HElpSupportState extends State<HElpSupport> {
  String foos = 'Select Category';

  int _selectedIndex = -1;
  List<String> _categories = ['Account', 'Payment ', 'Order '];
  var _selectedCategory;

  List<String> otherFaqs = ["Account", "Order", "Payments", "Bars"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text(
              "Help & Support",
              style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff4D4F50),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "?",
                  style: GoogleFonts.tajawal(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffADADAD),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Image.asset(
                "assets/images/Help.png",
                scale: 3,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/icons/phone.png",
                    scale: 3,
                    color: Color(0xffB11E2D),
                  ),
                  Image.asset(
                    "assets/icons/Gmail.png",
                    scale: 3,
                  ),
                  Image.asset(
                    "assets/icons/whatsapp.png",
                    scale: 3,
                  ),
                ],
              ),
              SizedBox(
                height: 1.8.h,
              ),
              Image.asset(
                "assets/icons/airphone.png",
                scale: 3,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: secondryColor,
                    isDense: true,
                    border: DecoratedInputBorder(
                      child: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadow: const [
                        BoxShadow(
                          offset: Offset(0.0, 1.0),
                          color: Color(0x33000000),
                          blurRadius: 2,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: secondryColor,
                    isDense: true,
                    border: DecoratedInputBorder(
                      child: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadow: const [
                        BoxShadow(
                          offset: Offset(0.0, 1.0),
                          color: Color(0x33000000),
                          blurRadius: 2,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "Describe your issue....",
                    hintStyle: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: secondryColor,
                    isDense: true,
                    border: DecoratedInputBorder(
                      child: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadow: const [
                        BoxShadow(
                          offset: Offset(0.0, 1.0),
                          color: Color(0x33000000),
                          blurRadius: 2,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //       hintText: "Select Category",
              //       hintStyle: GoogleFonts.tajawal(
              //         fontSize: 17.sp,
              //         fontWeight: FontWeight.w400,
              //       ),
              //       suffixIcon: Icon(
              //         Icons.keyboard_arrow_down,
              //         size: 25,
              //       ),
              //       filled: true, //<-- SEE HERE
              //       fillColor: secondryColor,
              //       isDense: true,
              //       border: DecoratedInputBorder(
              //         child: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         shadow: const [
              //           BoxShadow(
              //             offset: Offset(0.0, 1.0),
              //             color: Color(0x33000000),
              //             blurRadius: 2,
              //           )
              //         ],
              //       )),
              // ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 1.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 1.0),
                        color: Color(0x33000000),
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                      title: Text(
                        (this.foos),
                        style: GoogleFonts.tajawal(
                            color: Color.fromRGBO(100, 99, 99, 1),
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
                            itemCount: categorylist.length,
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
                                              contentPadding: EdgeInsets.all(0),
                                              leading: Container(
                                                padding:
                                                    EdgeInsets.only(right: 3.w),
                                                width: 1.5.w,
                                                color: Color.fromRGBO(
                                                    171, 23, 49, 1),
                                              ),
                                              title: Text(
                                                categorylist[index]['Name'],
                                                style: GoogleFonts.tajawal(
                                                    color: Color.fromRGBO(
                                                        77, 79, 80, 1),
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          : ListTile(
                                              title: Text(
                                                categorylist[index]['Name'],
                                                style: GoogleFonts.tajawal(
                                                    color: Color.fromRGBO(
                                                        77, 79, 80, 1),
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              onTap: () {
                                                if (categorylist[index]
                                                        ['Name'] ==
                                                    "Account") {
                                                  setState(() {
                                                    _selectedIndex = index;
                                                    this.foos = "Account";
                                                  });
                                                } else if (categorylist[index]
                                                        ['Name'] ==
                                                    "Payment") {
                                                  setState(() {
                                                    _selectedIndex = index;
                                                    this.foos = "Payment";
                                                  });
                                                } else if (categorylist[index]
                                                        ['Name'] ==
                                                    "Order") {
                                                  setState(() {
                                                    _selectedIndex = index;
                                                    this.foos = "Order";
                                                  });
                                                }
                                              })),
                                ],
                              );
                            })
                      ]),
                ),
              ),
              // DropdownButtonFormField<String>(
              //   value: _selectedCategory,
              //   items: _categories.map((category) {
              //     return DropdownMenuItem<String>(
              //       value: category,
              //       child: Container(
              //         margin: EdgeInsets.only(left: 2.w, right: 2.w),
              //         child: Text(
              //           category,
              //           style: GoogleFonts.tajawal(
              //             fontSize: 18.sp,
              //             fontWeight: FontWeight.w500,
              //             color: Color(0xff424242),
              //           ),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedCategory = value!;
              //     });
              //   },
              //   decoration: InputDecoration(
              //       contentPadding:
              //           EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              //       filled: true, //<-- SEE HERE
              //       fillColor: secondryColor,
              //       hintText: "Select Category",
              //       hintStyle: GoogleFonts.tajawal(
              //         fontSize: 17,
              //         fontWeight: FontWeight.w400,
              //       ),
              //       isDense: true,
              //       border: DecoratedInputBorder(
              //         child: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         shadow: const [
              //           BoxShadow(
              //             offset: Offset(0.0, 1.0),
              //             color: Color(0x33000000),
              //             blurRadius: 3,
              //           )
              //         ],
              //       )),
              // ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff851729),
                      Color(0xffAF1731),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // border: Border.all(color: Color(0xffC11331)),
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1.5.h,
                      bottom: 1.h,
                    ),
                    child: Text(
                      "SEND",
                      style: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: secondryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Row(
                  children: [
                    Text(
                      "FAQs",
                      style: GoogleFonts.tajawal(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4D4F50),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Image.asset(
                      "assets/icons/Faq.png",
                      scale: 4.5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        offset: Offset(4, 4),
                        blurRadius: 6,
                        spreadRadius: -2,
                      )
                    ],
                  ),

                  // color: Colors.red,
                  width: 100.w,
                  child: Column(
                    children: [
                      ...List.generate(
                        otherFaqs.length,
                        (index) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 0.5.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FaqsDetails(
                                        titleName: otherFaqs[index],
                                        otherFaqs: otherFaqs,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '''${otherFaqs[index]}''',
                                      // FaqList[index]['FaqName'],
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff424242),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            (otherFaqs.length - 1) != index
                                ? Divider()
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
