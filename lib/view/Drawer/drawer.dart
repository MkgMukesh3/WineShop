import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/view/Home/home_page.dart';
import 'package:mybar/view/order/order_history.dart';
import 'package:mybar/view/profile/about_screen.dart';
import 'package:mybar/view/profile/help_support.dart';
import 'package:mybar/view/profile/my_profile.dart';
import 'package:mybar/view/profile/profile_password.dart';
import 'package:mybar/view/signin/signin.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.sizeOf(context).width > 728 ? 60.w : 80.w,
        backgroundColor: secondryColor,
        child: Container(
          color: secondryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff424242),
                      ),
                    ),
                    Text(
                      "My Account",
                      style: GoogleFonts.tajawal(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff424242),
                      ),
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD41335),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/icons/admin.png",
                          scale: 3.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                "C Jordan",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff424242),
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Color(0xff3C3C3C),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width >
                                                    728
                                                ? 15.w
                                                : 28.w,
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          strutStyle:
                                              StrutStyle(fontSize: 12.0),
                                          text: TextSpan(
                                              style: GoogleFonts.roboto(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff3C3C3C),
                                              ),
                                              text: 'Duxten Road, 338750'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Change",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffA1172F),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        "assets/icons/change.png",
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: drawerList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: Container(
                          color: _selectedIndex == index
                              ? Color.fromRGBO(
                                  161, 23, 47, 1) // Change color when selected
                              : null,
                          child: ListTile(
                            selected: _selectedIndex == index,
                            dense: true,
                            leading: Container(
                                height: 9.h,
                                width: 6.w,
                                child: ImageIcon(
                                    AssetImage(drawerList[index]['Image']),
                                    color: _selectedIndex == index
                                        ? Colors
                                            .white // Change color when selected
                                        : Color(0xff424242))
                                // Image.asset(
                                //   drawerList[index]['Image'],
                                //   color: Color(0xff424242),
                                //   fit: BoxFit.contain,
                                // ),
                                ),
                            title: Text(
                              drawerList[index]['drawerName'],
                              style: GoogleFonts.tajawal(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: _selectedIndex == index
                                    ? Colors.white // Change color when selected
                                    : Color(0xff424242),
                              ),
                            ),
                            onTap: () async {
                              if (drawerList[index]['drawerName'] ==
                                  "My Profile") {
                                setState(() {
                                  _selectedIndex = index;
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyProfile()),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "Help & Support") {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HElpSupport()),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "About") {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutScreen()),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "Change Password") {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profilepass()),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "Home") {
                                setState(() {
                                  _selectedIndex = index;
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyProfile()),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "Order History") {
                                setState(() {
                                  _selectedIndex = index;
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderHistoryScreen(),
                                  ),
                                );
                              } else if (drawerList[index]['drawerName'] ==
                                  "Sign out") {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.clear();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Signin(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
