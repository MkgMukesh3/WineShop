import 'package:flutter/material.dart';
import 'package:mybar/constant.dart';
import 'package:mybar/model/bar_model.dart';
import 'package:mybar/widgets/bars_widget/new_bar_banners.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavouriteBars extends StatefulWidget {
  const FavouriteBars({super.key});

  @override
  State<FavouriteBars> createState() => _FavouriteBarsState();
}

class _FavouriteBarsState extends State<FavouriteBars> {
  List<BarModel> listOfFavouriteBars = [];

  void initState() {
    super.initState();
    listOfFavouriteBars.addAll(bars);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        width: 100.w,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listOfFavouriteBars!.length,
          itemBuilder: (context, index) {
            return NewBarBanners(
              barDetails: listOfFavouriteBars![index],
              isVertical: true,
              isFavourite: true,
              removeFromFavourite: () {
                listOfFavouriteBars!.remove(listOfFavouriteBars![index]);
                setState(
                  () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
