import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  List AboutList = [
    {
      "Name": "About Mybar",
    },
    {
      "Name": "Privacy Policy",
    },
    {
      "Name": "Terms & Conditions",
    },
  ];
  _launchPrivacyPolicy() async {
    var url = Uri.parse("https://www.mybar.sg/p/terms");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTandC() async {
    var url = Uri.parse("https://www.mybar.sg/p/terms");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchAbout() async {
    var url = Uri.parse("https://www.mybar.sg/p/About-Us/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: GoogleFonts.roboto(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff4D4F50),
          ),
        ),
        surfaceTintColor: secondryColor,
        backgroundColor: secondryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 1.0),
                  color: Color(0x33000000),
                  blurRadius: 2,
                )
              ], color: secondryColor, borderRadius: BorderRadius.circular(15)),
              // color: Colors.red,
              width: 100.w,

              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AboutList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AboutList[index]['Name'] == "About Mybar"
                              ? _launchAbout()
                              : AboutList[index]['Name'] == "Privacy Policy"
                                  ? _launchPrivacyPolicy()
                                  : _launchTandC();
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                          decoration: BoxDecoration(
                            color: secondryColor,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '''${AboutList[index]['Name']}''',
                                      // FaqList[index]['FaqName'],
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff4D4F50),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xffDADADA),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "App Version",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4F50),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "1.0.0",
                        style: GoogleFonts.tajawal(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4F50),
                        ),
                      ),
                    ),
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
