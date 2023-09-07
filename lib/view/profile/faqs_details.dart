import 'package:control_style/decorated_input_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqsDetails extends StatefulWidget {
  FaqsDetails({super.key, required this.titleName, required this.otherFaqs});

  String titleName;
  List<String> otherFaqs;

  @override
  State<FaqsDetails> createState() => _FaqsDetailsState();
}

class _FaqsDetailsState extends State<FaqsDetails> {
  var _selectedCategory;
  final List<String> items = [
    '''Kindly click on forgot password link on the website and enter your email ID. You will receive an email with the subjectRecovery Email follow the instructions provided further or follow the OTP flow available at the time of sign-in''',
  ];
  String? selectedValue;

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
              backgroundColor: secondryColor,
              surfaceTintColor: secondryColor,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("FAQs",
                              style: GoogleFonts.roboto(
                                  color: Color(0xff4D4F50),
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 2.w,
                          ),
                          Image.asset(
                            "assets/icons/Faq.png",
                            scale: 4.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h, left: 5.w),
              child: Text("${widget.titleName}",
                  style: GoogleFonts.roboto(
                      color: Color(0xff4D4F50),
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Color(0x33000000),
                  blurRadius: 2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    'How to make payment?',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        title: Text(
                      '''Kindly click on forgot password link on the website and enter your email ID. You will receive an email with the subjectRecovery Email follow the instructions provided further or follow the OTP flow available at the time of sign-in ''',
                      style: GoogleFonts.tajawal(
                          color: Color(0xff4D4F50),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 1.h, right: 5.w, left: 5.w),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Color(0x33000000),
                  blurRadius: 2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    '${widget.titleName} FQA 2',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        title: Text(
                      '''Kindly click on forgot password link on the website and enter your email ID. You will receive an email with the subjectRecovery Email follow the instructions provided further or follow the OTP flow available at the time of sign-in ''',
                      style: GoogleFonts.tajawal(
                          color: Color(0xff4D4F50),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 1.h, right: 5.w, left: 5.w),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Color(0x33000000),
                  blurRadius: 2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    '${widget.titleName} FAQ 3',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        title: Text(
                      '''Kindly click on forgot password link on the website and enter your email ID. You will receive an email with the subjectRecovery Email follow the instructions provided further or follow the OTP flow available at the time of sign-in ''',
                      style: GoogleFonts.tajawal(
                          color: Color(0xff4D4F50),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 1.h, right: 5.w, left: 5.w),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Color(0x33000000),
                  blurRadius: 2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    '${widget.titleName} FAQ 4',
                    style: GoogleFonts.tajawal(
                        color: Color(0xff4D4F50),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        title: Text(
                      '''Kindly click on forgot password link on the website and enter your email ID. You will receive an email with the subjectRecovery Email follow the instructions provided further or follow the OTP flow available at the time of sign-in ''',
                      style: GoogleFonts.tajawal(
                          color: Color(0xff4D4F50),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h, left: 5.w),
              child: Row(
                children: [
                  Text("Other FAQs",
                      style: GoogleFonts.roboto(
                          color: Color(0xff4D4F50),
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500)),
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
              padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(4, 4),
                  blurRadius: 6,
                  spreadRadius: -2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ...List.generate(
                    widget.otherFaqs.length,
                    (index) => widget.otherFaqs[index] != widget.titleName
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 0.5.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FaqsDetails(
                                          titleName: widget.otherFaqs[index],
                                          otherFaqs: widget.otherFaqs,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '''${widget.otherFaqs[index]}''',
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
                              (widget.otherFaqs.length - 1) != index
                                  ? Divider()
                                  : Container(),
                            ],
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
