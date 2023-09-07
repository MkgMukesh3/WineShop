import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/Home/home_screen.dart';
import 'package:mybar/widgets/oprn_History_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        surfaceTintColor: secondryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Column(
          children: [
            Text("Order History",
                style: GoogleFonts.roboto(
                    color: Color(0xff4D4F50),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.h),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xffD3D3D3)),
                        right: BorderSide(color: Color(0xffD3D3D3)),
                      ),
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
                      color: Colors.white,
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     blurRadius: 9.0, // soften the shadow
                      //     spreadRadius: 1.0, //extend the shadow
                      //     offset: Offset(
                      //       1.0, // Move to right 5  horizontally
                      //       1.0, // Move to bottom 5 Vertically
                      //     ),
                      //   )
                      // ],
                      border: Border(
                        bottom: BorderSide(color: Color(0xffD3D3D3)),
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
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 3.w),
                  child: Text("Today",
                      style: GoogleFonts.roboto(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(123, 123, 123, 1),
                      )),
                ),
                OpenHistoryWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 3.w),
                  child: Text("20 May 2021",
                      style: GoogleFonts.roboto(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(123, 123, 123, 1),
                      )),
                ),
                CharlieBar(),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 3.w),
                  child: Text("18 May 2021",
                      style: GoogleFonts.roboto(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(123, 123, 123, 1),
                      )),
                ),
                CharlieBar(),
                OpenHistoryWidget(),
                OpenHistoryWidget(),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
