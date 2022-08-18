import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/view/footer_view.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantImageGallery_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantNameAndReview_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantOverviewTab_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantPhotoTab_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantMenuTab.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/restaurantReviewsTab_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoAppBar_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoRestaurantButtons_widget.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoRestaurantTabBar_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:flutter/material.dart';

class ZomatoRestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurant';
  @override
  _ZomatoRestaurantScreenState createState() => _ZomatoRestaurantScreenState();
}

class _ZomatoRestaurantScreenState extends State<ZomatoRestaurantScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  bool isTyping = false;
  String restaurantName = "McDonald's";

  @override
  Widget build(BuildContext context) {
    //Getting aspect ratio
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.size.width;
    queryData.size.height;

    return Scaffold(
        //appBar: ZomatoAppBarWidget(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            ZomatoAppBarWidget(),
            // Restaurant Area Location Text
            Container(
              width: queryData.size.width * 0.8,
              child: AdaptiveText(
                "Home / Australia / Melbourne / City Centre / CBD / $restaurantName",
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.0,
                  color: Theme.of(context).textTheme.subtitle1.color,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.topLeft,
            ),

            // Restaurant Images
            RestaurantImageGalleryWidget(),
            //Restaurant Name and Review

            StickyHeader(
              header: Container(
                color: Theme.of(context).backgroundColor.withOpacity(1),
                child: Column(children: [
                  SizedBox(
                    width: queryData.size.width * 0.8,
                    height: queryData.size.height * 0.1,
                    child: RestaurantNameAndReview(restaurantName),
                  ),
                  SizedBox(
                      width: queryData.size.width * 0.8,
                      //height: queryData.size.height * 0.08,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AdaptiveText(
                              "Fast Food - Fast Food, Burger, American",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).textTheme.subtitle1.color,
                              ),
                            ),
                            AdaptiveText(
                              "CBD",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.0,
                                //:  Theme.of(context).textTheme.bodyText1.color,
                              ),
                            ),
                            AdaptiveText(
                              "Open Now - 24 Hours (Today) ",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).textTheme.subtitle2.color,
                              ),
                            )
                          ])),
                  SizedBox(
                    width: queryData.size.width * 0.8,
                    height: queryData.size.height * 0.08,
                    child: ZomatoRestaurantButtons(),
                  ),

                  //Tabs for Overview,Reviewws,Photos, Menu Page
                  ZomatoRestaurantTabBar(
                      _tabController, queryData.size.width * 0.8),
                ]),
              ),
              content: Container(
                height: 2300,
                width: queryData.size.width * 0.8,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Overview tab bar view widget
                    RestaurantOverviewTab(),

                    // Reviews tab bar view widget
                    Container(height: 200, child: RestaurantReviewsTab()),

                    //Photos tab bar view widget
                    RestaurantPhotoTab(),
                    //Menu tab bar view widget
                    RestaurantMenuTab(),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
            Footer(),
          ],
        )));
  }
}
