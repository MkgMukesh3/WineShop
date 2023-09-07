import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/model/product_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedeemAvailableItems extends StatelessWidget {
  RedeemAvailableItems(
      {super.key,
      required this.detailsData,
      required this.onAddTap,
      required this.addedMoreItems});
  ProductModel detailsData;
  final Function onAddTap;
  List<ProductModel> addedMoreItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color(0xffACACAC),
        ),
        ListTile(
          leading: Container(
              height: 15.h,
              width: 15.w,
              // color: Colors.blue,
              child: Image.asset(
                detailsData.productImage!,
                fit: BoxFit.contain,
              )),
          title: Text(
            detailsData.productName!,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detailsData.productDescription!,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          detailsData.validDate!,
                          style: GoogleFonts.tajawal(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff424242)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  addedMoreItems.contains(detailsData)
                      ? Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF26B90E), Color(0xFF26B90E)],
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  top: 0.5.h,
                                  bottom: 0.5.h),
                              child: Text("Added",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            onAddTap();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFFCA1D3B),
                                    Color(0xFF871327)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(bottom: 0.5.h),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w,
                                    right: 4.w,
                                    top: 0.5.h,
                                    bottom: 0.5.h),
                                child: Row(
                                  children: [
                                    Text(
                                      'Add',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
