import 'package:adaptive_user_interface_app/screens/ZomatoRestaurantScreen.dart';
import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../size_helpers.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';

class FullActionCardPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        margin: EdgeInsets.only(bottom: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionCard(
              title: 'Book a Table',
              subtitle: "Find a Table at the Best Restaurants",
              image: "images/food_image2.jpg",
            ),
            ActionCard(
              title: 'Go out for a meal',
              subtitle: "View the city's favourite dinning venues",
              image: "images/food_image3.jpeg",
            ),
            ActionCard(
              title: 'Order McDonalds',
              subtitle: "Learn more about dining at McDonalds",
              image: "images/mcdonalds_photo.jpg",
            ),
          ],
        ));
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  ActionCard({Key key, this.title, this.subtitle, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Container clicked");
          if (title == 'Order McDonalds') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ZomatoRestaurantScreen()));
          } else {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText(title),
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
          }
        },
        child: Container(
            height: 240,
            width: displayWidth(context) * 25,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFFE8E8E8)),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                //width: 340,
                //height: 160,
                child: Provider.of<AdaptiveWidgetsViewModel>(context)
                        .getImageColorFilterToggle
                    ? ColorFiltered(
                        colorFilter:
                            AdaptiveColorFilter.getAdaptiveColorFilter(context),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(image),
                              )),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(image),
                            )),
                      ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 16),
                  margin: EdgeInsets.all(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdaptiveText(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText2.color),
                      ),
                      AdaptiveText(
                        subtitle,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyText2.color),
                        // maxLines: 1,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
            ])));
  }
}
