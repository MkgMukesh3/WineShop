import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/favourite/favourite.dart';
import 'package:mybar/view/Collections/collections.dart';
import 'package:mybar/view/Home/home_page.dart';
import 'package:mybar/view/Promotion/promotion.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.passIndex});
  int? passIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  void initState() {
    super.initState();
    selectedIndex = widget.passIndex ?? 0;
    setState(() {});
  }

  int backIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedIndex == 1
          ? Collections(onBackTap: () {
              setState(() {
                selectedIndex = selectedIndex == backIndex ? 0 : backIndex;
              });
            })
          : selectedIndex == 2
              ? Promotion(onBackTap: () {
                  setState(() {
                    selectedIndex = selectedIndex == backIndex ? 0 : backIndex;
                  });
                })
              : selectedIndex == 3
                  ? FavouritePage(onBackTap: () {
                      setState(() {
                        selectedIndex =
                            selectedIndex == backIndex ? 0 : backIndex;
                      });
                    })
                  : HomePage(),
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
            ),
            label: 'Favourtites',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: primaryColor,
        backgroundColor: Colors.white,
        // selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    backIndex = selectedIndex;
    setState(() {
      selectedIndex = index;
    });
  }
}
