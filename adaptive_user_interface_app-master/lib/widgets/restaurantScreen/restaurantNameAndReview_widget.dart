import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class RestaurantNameAndReview extends StatelessWidget {
  RestaurantNameAndReview(String this.restaurantName);
  String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: const EdgeInsets.all(4.0),
        child: AdaptiveText(
          restaurantName,
          style: TextStyle(
            fontSize: 36,
            letterSpacing: 1.0,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.star,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75))),
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.star,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75))),
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.star,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75))),
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.star,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75))),
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.star_outline,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .color
                          .withOpacity(0.75))),
              Container(
                  padding: const EdgeInsets.all(4.0),
                  child: AdaptiveText(
                    "4.0",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ))
            ],
          ),
          Flexible(child:AdaptiveText(
            "43 Reviews",
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1.0,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          )),
        ],
      ),
    ]);
  }
}
