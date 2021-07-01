import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/restaurantScreen/zomatoSimilarRestaurants_widget.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveRaisedButton.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveFlatButton.dart';
import 'package:provider/provider.dart';
import 'keyFeatureCheckMarks_widget.dart';
import 'zomatoDirectionInfo_widget.dart';
import 'zomatoUserReview_widget.dart';

class RestaurantOverviewTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Main Info Column
        // About This Place
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),

              Expanded(
                flex: 1,
                child: AdaptiveText(
                  "About This Place",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.0,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdaptiveText(
                      "Menu",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                    AdaptiveFlatButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                            backgroundColor: Theme.of(context).backgroundColor,
                            title: new AdaptiveText("See all menus"),
                            content: new AdaptiveText(
                                "Consider this action as a success!"),
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
                      child: Row(
                        children: [
                          AdaptiveText(
                            "See all menus",
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 1.0,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //Menu Photos
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    title: new AdaptiveText("Food Menu"),
                                    content: new AdaptiveText(
                                        "Consider this action as a success!"),
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
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Provider.of<AdaptiveWidgetsViewModel>(
                                              context)
                                          .getImageColorFilterToggle
                                      ? ColorFiltered(
                                          colorFilter: AdaptiveColorFilter
                                              .getAdaptiveColorFilter(context),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/BigMac.jpeg'),
                                          ),
                                        )
                                      : Image(
                                          image: AssetImage(
                                              'images/mcdonalds_3.png'),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AdaptiveText(
                                    "Food Menu",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                  AdaptiveText(
                                    "20 Pages",
                                    style: TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 1.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    title: new AdaptiveText("Beverages"),
                                    content: new AdaptiveText(
                                        "Consider this action as a success!"),
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
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Provider.of<AdaptiveWidgetsViewModel>(
                                              context)
                                          .getImageColorFilterToggle
                                      ? ColorFiltered(
                                          colorFilter: AdaptiveColorFilter
                                              .getAdaptiveColorFilter(context),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/BigMac.jpeg'),
                                          ),
                                        )
                                      : Image(
                                          image: AssetImage(
                                              'images/mcdonalds_4.png'),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AdaptiveText(
                                    "Beverages",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                  AdaptiveText(
                                    "3 Pages",
                                    style: TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 1.0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),

              //Cuisines
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdaptiveText(
                      "Cuisines",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AdaptiveRaisedButton(
                            child: AdaptiveText(
                              "Fast Food",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  color: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .color,
                                  fontWeight: FontWeight.w200),
                            ),
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(width: 2, color: Colors.grey)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  title: new AdaptiveText("Fast Food"),
                                  content: new AdaptiveText(
                                      "Consider this action as a success!"),
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AdaptiveRaisedButton(
                            child: AdaptiveText(
                              "Burger",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  color: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .color,
                                  fontWeight: FontWeight.w200),
                            ),
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(width: 2, color: Colors.grey)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  title: new AdaptiveText("Burger"),
                                  content: new AdaptiveText(
                                      "Consider this action as a success!"),
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AdaptiveRaisedButton(
                            child: AdaptiveText(
                              "American",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  color: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .color,
                                  fontWeight: FontWeight.w200),
                            ),
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(width: 2, color: Colors.grey)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  title: new AdaptiveText("American"),
                                  content: new AdaptiveText(
                                      "Consider this action as a success!"),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Average Cost Section
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AdaptiveText(
                        "Average Cost",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.0,
                            color: Theme.of(context).textTheme.subtitle1.color,
                            fontWeight: FontWeight.w200),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AdaptiveText(
                          "\$25 for two people (approx.)",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.0,
                              //color: Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: AdaptiveText(
                          "How do we calculate cost for two?",
                          style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 1.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .color
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w200,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      AdaptiveText(
                        "Cash and Cards accepted",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.0,
                            //color: Theme.of(context).textTheme.bodyText1.color,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  )),

              //More Info
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdaptiveText(
                    "More Info",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontWeight: FontWeight.w400),
                  ),
                  //Checkmarks
                  KeyFeatureCheckMarks(context, [
                    "Breakfast",
                    "Wheelchair Accessible",
                    "Indoor Seating",
                    "Wifi",
                    "Takeaway Available",
                    "Table Reservation Not Required",
                    "All Day Breakfast",
                    "Kid Friendly"
                  ])
                ],
              ),

              //Similar Restaurants
              Expanded(flex: 10, child: ZomatoSimilarRestaurants()),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              //Review

              Flexible(flex: 7, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              // //User Review 2
              Flexible(flex: 7, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              // //User Review 3
              Flexible(flex: 7, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              // //User Review 4
              Flexible(flex: 7, child: ZomatoUserReview(3)),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              AdaptiveFlatButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                      backgroundColor: Theme.of(context).backgroundColor,
                      title: new AdaptiveText("View all Reviews"),
                      content: new AdaptiveText(
                          "Consider this action as a success!"),
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
                child: Row(
                  children: [
                    AdaptiveText("View all Reviews",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16)),
                    Icon(
                      Icons.arrow_right,
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ),

              Spacer(flex: 2),
            ],
          ),
        ),

        // Secondary Column containing Direction Info
        Expanded(
            flex: 1,
            child: Column(
                children: [SizedBox(height: 8), ZomatoDirectionInfoWidget()]))
      ],
    );
  }
}
