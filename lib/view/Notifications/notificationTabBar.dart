import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/Notifications/allNotification.dart';
import 'package:mybar/view/Notifications/barNotification.dart';
import 'package:mybar/view/Notifications/drinksNotification.dart';
import 'package:mybar/view/Notifications/promotionNotification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(47.sp),
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
                title: const Text('Notifications'),
                bottom: const TabBar(
                  dividerColor: Colors.transparent,
                  tabs: <Widget>[
                    Tab(
                      text: 'All',
                      icon: Icon(Icons.done_all),
                    ),
                    Tab(
                      text: 'Drinks',
                      icon: Icon(Icons.wine_bar),
                    ),
                    Tab(
                      text: 'Bar',
                      icon:
                          ImageIcon(AssetImage("assets/icons/personwine.png")),
                    ),
                    Tab(
                        text: 'Promotions',
                        icon: ImageIcon(
                            AssetImage("assets/icons/Promotion.png"))),
                  ],
                ),
              ),
            )),
        body: TabBarView(
          children: <Widget>[
            AllNotification(),
            DrinksNotification(),
            BarNotification(),
            PromotionNotification()
          ],
        ),
      ),
    ));
  }
}
