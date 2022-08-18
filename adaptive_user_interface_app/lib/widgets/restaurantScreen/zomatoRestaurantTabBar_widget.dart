import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class ZomatoRestaurantTabBar extends StatelessWidget {
  ZomatoRestaurantTabBar(TabController this._tabController, double inputWidth);

  TabController _tabController;
  double inputWidth;

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: 50,
      width: queryData.size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.0),
       border: Border(bottom: BorderSide(color: Colors.grey[200], width: 2)),
      ),
        alignment: Alignment.bottomLeft,
        child: TabBar(
          isScrollable: true,
          labelPadding: EdgeInsets.only(bottom:2),
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).accentColor, width: 4))),
          tabs: [
            Tab(
              child: Container(
                margin:EdgeInsets.symmetric(vertical:3, horizontal:10),
                padding: EdgeInsets.symmetric(vertical:5, horizontal:8),
                child: AdaptiveText(
                    "Overview",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      color: _tabController.index == 0
                          ? Theme.of(context).accentColor
                          : Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ),
            ),
            Tab(
              child: Container(
                margin:EdgeInsets.symmetric(vertical:3, horizontal:10),
                  padding: EdgeInsets.symmetric(vertical:5, horizontal:8),
                child:  AdaptiveText(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      color: _tabController.index == 1
                          ? Theme.of(context).accentColor
                          : Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ),
             
            ),
            Tab(
              child: Container(
                margin:EdgeInsets.symmetric(vertical:3, horizontal:10),
                child: AdaptiveText(
                    "Photos",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      color: _tabController.index == 2
                          ? Theme.of(context).accentColor
                          : Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ),
            
            ),
            Tab(
              child: Container(
                margin:EdgeInsets.symmetric(vertical:3, horizontal:10),
                  padding: EdgeInsets.symmetric(vertical:5, horizontal:8),
                child: AdaptiveText(
                    "Menu",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      color: _tabController.index == 3
                          ? Theme.of(context).accentColor
                          : Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
             
              ),
            ),
          ],
        ),
     
    );
  }
}
