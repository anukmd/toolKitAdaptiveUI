import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveRaisedButton.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveLink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZomatoDirectionInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: Theme.of(context).textTheme.bodyText2.color, width: 2)),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Contact Info
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdaptiveText(
                  "Call",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.0,
                    color: Theme.of(context).textTheme.bodyText2.color,
                  ),
                ),
                AdaptiveText(
                  "+61396706693",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          //Directions
          Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdaptiveText(
                    "Direction",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  if (Provider.of<AdaptiveWidgetsViewModel>(context)
                      .getImageColorFilterToggle)
                    ColorFiltered(
                        colorFilter:
                            AdaptiveColorFilter.getAdaptiveColorFilter(context),
                        child: Image(
                            image:
                                AssetImage("assets/images/McDonaldsMap.png")))
                  else
                    Image(image: AssetImage("assets/images/McDonaldsMap.png")),
                  SizedBox(height: 5),
                  AdaptiveText(
                    "406 Bourke Street, CBD, Melbourne",
                    style: TextStyle(
                      fontSize: 16,
                      //letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ],
              )),

          //Buttons
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AdaptiveRaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.file_copy_outlined,
                          size: 20, color: Theme.of(context).accentColor),
                      AdaptiveText(
                        "Copy",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1.0,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                    ],
                  ),
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).accentColor)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        title: new AdaptiveText("Copy"),
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
                SizedBox(
                  width: 10,
                ),
                AdaptiveRaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.directions,
                          size: 20, color: Theme.of(context).accentColor),
                      AdaptiveText(
                        "Direction",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1.0,
                          color: Theme.of(context).textTheme.bodyText2.color,
                        ),
                      ),
                    ],
                  ),
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).accentColor)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        title: new AdaptiveText("Direction"),
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
              ],
            ),
          ),

          //Final Text
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: AdaptiveLink(
                      child: AdaptiveText(
                        "See all 178 McDonald's outlets in Melbourne ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      url:
                          "https://www.zomato.com/melbourne/restaurants/mcdonalds"),
                ),
                Flexible(
                  //flex:1,
                  child: Icon(
                    Icons.arrow_right,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
