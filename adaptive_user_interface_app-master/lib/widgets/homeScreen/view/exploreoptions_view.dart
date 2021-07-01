import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import '../size_helpers.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveLink.dart';

class ExploreOptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        width: displayWidth(context) * 100,
        padding: EdgeInsets.symmetric(vertical: 100),
        color: Color(0XFFFCFCFC).withOpacity(0.5),
        alignment: Alignment.center,
        child: Container(
            width: displayWidth(context) * 80,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: AdaptiveText("Explore other options for you here",
                    style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).textTheme.headline4.color)),
              ),
              NearMeWidget(
                title: "Cuisine",
                list: ["American", "Asian", "Indian", "Burger", "Cafe","Italian","Desserts","Chinese"],
                bottomMargin: 100.0,
              ),
              NearMeWidget(
                title: "restaurants",
                list: ["Bakeries", "Bars", "Breweries", "Fast Food", "Cafes","Vineyards"],
                bottomMargin: 0.0,
              ),
            ])));
  }
}

class NearMeWidget extends StatelessWidget {
  NearMeWidget({Key key, this.title, this.list, this.bottomMargin})
      : super(key: key);
  final String title;
  final List<String> list;
  final double bottomMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: AdaptiveText("Popular $title near me",
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).textTheme.headline4.color)),
          ),
          Wrap(
            children: list
                .map((i) => new Container(
                    margin: EdgeInsets.only(right: 10),
                    child: AdaptiveLink(
                        child: AdaptiveText("$i near me",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .color)),
                        url: "https://www.zomato.com/" + "$i" + "-near-me")))
                .toList(),
          )
        ]));
  }
}
