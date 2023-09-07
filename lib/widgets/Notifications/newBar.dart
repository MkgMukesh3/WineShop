import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewBarAddedWidget extends StatefulWidget {
  const NewBarAddedWidget({super.key});

  @override
  State<NewBarAddedWidget> createState() => _NewBarAddedWidgetState();
}

class _NewBarAddedWidgetState extends State<NewBarAddedWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, top: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/new.png",
            scale: 8.sp,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 2.w, right: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      3.0, // Move to right 5  horizontally
                      3.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: Stack(children: [
                ListTile(
                  title: Text(
                    "New Bar Added Near You",
                    style: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4D4F50),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 0.5.h),
                    child: Text(
                      "Nibh vestibulum egestas condimentum nibh arcu mauris lacus, malesuada sed. Etiam volutpat condimentum vitae.",
                      style: GoogleFonts.tajawal(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff969696),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.close)))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
