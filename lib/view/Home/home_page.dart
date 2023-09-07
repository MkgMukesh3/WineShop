import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/model/product_model.dart';
import 'package:mybar/view/Bars/bar_listing.dart';
import 'package:mybar/view/Drawer/drawer.dart';
import 'package:mybar/view/Notifications/notificationTabBar.dart';
import 'package:mybar/view/Cart/cart.dart';
import 'package:mybar/view/combos/all_combos.dart';
import 'package:mybar/view/product/product_details.dart';
import 'package:mybar/view/product/product_listing.dart';
import 'package:mybar/widgets/bars_widget/bar_banners.dart';
import 'package:mybar/widgets/products/home_products.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List whiskyList = [
    "assets/images/whisky1.png",
    "assets/images/whisky2.png",
    "assets/images/whisky1.png",
    "assets/images/whisky2.png",
  ];

  int selectedCategory = 0;

  List<BarModel> BarfavouriteList = [];
  List<ProductModel> drinksfavoriteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset(
              "assets/icons/admin.png",
              scale: 3,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                    color: Color(0xff3C3C3C),
                  ),
                  Text(
                    "Duxten Road, 338750",
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3C3C3C),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(
                          addedToCart: addedToCart,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 0.w),
                        child: Image.asset(
                          "assets/icons/cart.png",
                          scale: 3,
                        ),
                      ),
                      addedToCart.length > 0
                          ? Positioned(
                              right: 0.w,
                              child: Image.asset(
                                "assets/icons/active.png",
                                scale: 5,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ));
                  },
                  child: Image.asset(
                    "assets/icons/notification.png",
                    scale: 3,
                  ),
                ),
              ],
            )
          ],
        ),
        surfaceTintColor: secondryColor,
        backgroundColor: secondryColor,
      ),
      drawer: MyDrawer(),
      body: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2.h),
                    bottomRight: Radius.circular(2.h),
                  ),
                ),
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 5.h,
                    // ),

                    Container(
                      margin: EdgeInsets.only(
                        top: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: secondryColor,
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xffACACAC),
                          ),
                          suffixIcon: Image.asset(
                            "assets/icons/filter.png",
                            scale: 3,
                          ),
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: greyColor,
                          ),
                          hintText: "Search For Drinks...",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      child: SizedBox(
                        height: 25.h,
                        // width: 100.w,
                        child: PageView.builder(
                          itemCount: 3,
                          pageSnapping: true,
                          itemBuilder: (context, pagePosition) {
                            print("pagePosition $pagePosition");
                            return Image.asset(
                              "assets/images/banner.png",
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      "Category",
                      style: GoogleFonts.roboto(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),

                    SizedBox(
                      height: 7.h,
                      child: DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: primaryColor,

                              indicatorColor: primaryColor,
                              dividerColor: Colors.white,
                              indicatorPadding: EdgeInsets.all(0),

                              indicatorSize: TabBarIndicatorSize.label,
                              labelStyle: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                              onTap: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              },
                              // TABS
                              tabs: const [
                                Tab(
                                  text: 'Whisky',
                                ),
                                Tab(
                                  text: 'Wine',
                                ),
                                Tab(
                                  text: 'Beer',
                                ),
                                Tab(
                                  text: 'Cocktail',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.h,
                            ),
                            SizedBox(
                              height: 0,
                              child: TabBarView(
                                children: [
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedCategory == 0
                              ? "Whisky"
                              : selectedCategory == 1
                                  ? "Wine"
                                  : selectedCategory == 2
                                      ? "Beer"
                                      : "Cocktail",
                          style: GoogleFonts.roboto(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4D4F50),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductListing()),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        children: [
                          HomeProductWidget(
                            productDetails: products[index],
                            onTapProducts: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                      productDetails: products[index],
                                    ),
                                  ));
                            },
                            drinksfavoriteList: drinksfavoriteList,
                            addRemoveFav: () {
                              drinksfavoriteList.any(
                                      (element) => element == products[index])
                                  ? drinksfavoriteList.remove(products[index])
                                  : drinksfavoriteList.add(products[index]);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Combos",
                          style: GoogleFonts.roboto(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4D4F50),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCombos()),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: PageView.builder(
                        itemCount: 3,
                        pageSnapping: true,
                        itemBuilder: (context, pagePosition) {
                          return Container(
                            height: 25.h,
                            width: 10.w,
                            margin: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 0.h),
                            padding: EdgeInsets.only(
                                left: 1.w, right: 1.w, top: 2.h),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 246, 166, 0),
                                  Color(0xFFFFF6A6)
                                ],
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.w),
                                              child: Image.asset(
                                                "assets/icons/crown.png",
                                                scale: 3,
                                              ),
                                            ),
                                            Text(
                                              "Top of the week",
                                              style: GoogleFonts.roboto(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff4D4F50),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "MIX COMBO",
                                          style: GoogleFonts.roboto(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff4D4F50),
                                          ),
                                        ),
                                        Text(
                                          "\$150",
                                          style: GoogleFonts.roboto(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff4D4F50),
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/rating.png",
                                          scale: 3,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(width: 1)),
                                          padding: const EdgeInsets.all(8.0),
                                          margin: EdgeInsets.only(top: 1.h),
                                          child: Text(
                                            "Reedem Now",
                                            style: GoogleFonts.roboto(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff4D4F50),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Image.asset(
                                    "assets/images/combo.png",
                                    height: 25.h,
                                    // scale: 4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bars",
                          style: GoogleFonts.roboto(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4D4F50),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarListing()),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    // width: 100.w,
                    height: 42.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          bars.length,
                          (index) => BarBanners(
                            barModel: bars[index],
                            backColor: Color.fromRGBO(43, 36, 122, 0.5),
                            favouriteList: BarfavouriteList,
                            addToFavourite: () {
                              BarfavouriteList.contains(bars[index])
                                  ? BarfavouriteList.remove(bars[index])
                                  : BarfavouriteList.add(bars[index]);
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                    child: Image.asset(
                      "assets/images/bottom_banner.png",
                      scale: 3,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
