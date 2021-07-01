import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveLink.dart';
import '../size_helpers.dart';

class FullCollectionPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 432,
        margin: EdgeInsets.only(bottom: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: AdaptiveText("Collections",
                style: TextStyle(
                  fontSize: 36,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2
                      //.headline5
                      .color, //Color(0XFF1c1c1c)
                )),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                    flex: 4,
                    child: AdaptiveText(
                        "Explore curated lists of top restaurants, cafes, pubs, and bars in Melbourne, based on trends",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText2
                                //.headline2
                                .color /*Color(0XFF363636)*/))),
                Expanded(
                    flex: 1,
                    child: AdaptiveLink(
                        child: AdaptiveText(
                          "All collections in Melbourne",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).accentColor),
                          textAlign: TextAlign.end,
                        ),
                        url: "https://www.zomato.com/melbourne/collections")),
              ])),
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CollectionCard(
                  title: "20 Best New Openings (So Far)",
                  subtitle: "20 Places",
                  image: 'images/food_image4.jpg'),
              CollectionCard(
                  title: "Must-Try Finish at Home Menus",
                  subtitle: "20 Places",
                  image: 'images/food_image5.jpg'),
              CollectionCard(
                  title: "#SaveHospo with Melbourne Institutions at Home",
                  subtitle: "20 Places",
                  image: 'images/food_image6.png'),
              CollectionCard(
                  title: "Where to Get Beer During Lockdown",
                  subtitle: "20 Places",
                  image: 'images/food_image7.png'),
            ],
          ))
        ]));
  }
}

class CollectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  CollectionCard({Key key, this.title, this.subtitle, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            title: new AdaptiveText("Hello"),
            content: new AdaptiveText("Consider this action as a success!"),
            actions: <Widget>[
              FlatButton(
                child: AdaptiveText('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
      child: Container(
          height: 320,
          //width: 258,
          width: displayWidth(context) * 20,
          //width: displayWidth(context)*0.25,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                colorFilter:
                    AdaptiveColorFilter.getAdaptiveColorFilter(context),
                fit: BoxFit.cover,
                image: AssetImage(image),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AdaptiveText(
                title,
                //maxLines: 1,
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    //Color(0XFFFFFFFF)
                    fontSize: 18),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                  height: 16,
                  // width: 258,
                  child: Row(
                    children: [
                      AdaptiveText(
                        subtitle,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            /*color: Color(0XFFFFFFFF),*/ fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
