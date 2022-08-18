import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZomatoSimilarRestaurants extends StatelessWidget {
  ZomatoSimilarRestaurants();

  double inputWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: AdaptiveText(
            "Similar Restaurants",
            style: TextStyle(
                fontSize: 25,
                letterSpacing: 1.0,
                color: Theme.of(context).textTheme.bodyText2.color,
                fontWeight: FontWeight.w400),
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 4,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Provider.of<AdaptiveWidgetsViewModel>(context)
                            .getImageColorFilterToggle
                        ? ColorFiltered(
                            colorFilter:
                                AdaptiveColorFilter.getAdaptiveColorFilter(
                                    context),
                            child: Image(
                              image: AssetImage('assets/images/BigMac.jpeg'),
                            ))
                        : Image(
                            image: AssetImage('assets/images/BigMac.jpeg'),
                          )),
              ),
              Expanded(
                flex: 4,
                child: buildRestaurantText("Maccas", "Fast Food", 4, context),
              )
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 4,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Provider.of<AdaptiveWidgetsViewModel>(context)
                            .getImageColorFilterToggle
                        ? ColorFiltered(
                            colorFilter:
                                AdaptiveColorFilter.getAdaptiveColorFilter(
                                    context),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('images/mcdonalds_4.png'),
                            ))
                        : Image(
                            fit: BoxFit.fill,
                            image: AssetImage('images/mcdonalds_4.png'),
                          )),
              ),
              Flexible(
                  flex: 4,
                  child: buildRestaurantText(
                      "Mickey Dee's", "Fast Food", 1, context))
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Provider.of<AdaptiveWidgetsViewModel>(context)
                          .getImageColorFilterToggle
                      ? ColorFiltered(
                          colorFilter:
                              AdaptiveColorFilter.getAdaptiveColorFilter(
                                  context),
                          child: Image(
                            image:
                                AssetImage('assets/images/ChickenNuggets.jpeg'),
                          ))
                      : Image(
                          image:
                              AssetImage('assets/images/ChickenNuggets.jpeg'),
                        ),
                ),
              ),
              Flexible(
                  flex: 4,
                  child: buildRestaurantText(
                      "Mcdonald's 2", "Fast Food", 5, context))
            ])
          ]),
        ),
      ],
    ));
  }
}

Widget buildRestaurantText(String restaurantName, String restaurantCategory,
    int reviewScore, BuildContext context) {
  List<Widget> reviewLine = List<Widget>();

  //Filled in Stars
  for (int i = 0; i < reviewScore; i++) {
    reviewLine
        .add(Icon(Icons.stars_rounded, color: Theme.of(context).primaryColor));
  }
  //Empty stars
  for (int i = 0; i < (5 - reviewScore); i++) {
    reviewLine.add(Icon(Icons.stars_rounded,
        color: Theme.of(context).primaryColor.withOpacity(0.5)));
  }
  //Review Score
  reviewLine.add(Container(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: AdaptiveText(
      reviewScore.toString(),
      style: TextStyle(
          fontSize: 16,
          letterSpacing: 1.0,
          color: Theme.of(context).textTheme.bodyText2.color,
          fontWeight: FontWeight.w400),
    ),
  ));

  return Container(
    // flex: 3,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //Name
      AdaptiveText(
        restaurantName,
        style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.0,
            color: Theme.of(context).textTheme.subtitle1.color,
            fontWeight: FontWeight.w300),
      ),
      //Reviews
      Row(children: reviewLine),
      //Category
      AdaptiveText(
        restaurantCategory,
        style: TextStyle(
            fontSize: 14,
            letterSpacing: 1.0,
            color: Theme.of(context).textTheme.bodyText2.color,
            fontWeight: FontWeight.w400),
      ),
      //Location
      AdaptiveText(
        "Melbourne",
        style: TextStyle(
            fontSize: 14,
            letterSpacing: 1.0,
            color: Theme.of(context).textTheme.bodyText2.color,
            fontWeight: FontWeight.w400),
      ),
    ]),
  );
}
