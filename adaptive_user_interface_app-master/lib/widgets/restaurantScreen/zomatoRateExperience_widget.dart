import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class ZomatoRateExperienceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color:Theme.of(context).textTheme.bodyText2.color, width: 2)
            ),
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Tap to rate experience
              Container(
                padding: EdgeInsets.all(10),
                child: AdaptiveText(
                  "Tap to rate your experience",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              //Stars
              Container(
                  padding: EdgeInsets.all(8),
                  child: Row(children: [
                    Icon(Icons.star_outline, color: Colors.grey, size: 28),
                    Icon(Icons.star_outline, color: Colors.grey, size: 28),
                    Icon(Icons.star_outline, color: Colors.grey, size: 28),
                    Icon(Icons.star_outline, color: Colors.grey, size: 28),
                    Icon(Icons.star_outline, color: Colors.grey, size: 28)
                  ])),

              //Final Text
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdaptiveText(
                      "Write a Review",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
