import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveRaisedButton.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class ZomatoRestaurantButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        AdaptiveRaisedButton(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.star_border,
                      size: 14, color: Theme.of(context).primaryColor)),
              AdaptiveText(
                "Add Review",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.0,
                  color: Theme.of(context).textTheme.headline1.color,
                ),
              ),
            ],
          ),
          color: Theme.of(context).accentColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            //side: BorderSide(color: Colors.redAccent[400])
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Add Review"),
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
        ),
        AdaptiveRaisedButton(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.directions_outlined,
                      size: 14, color: Theme.of(context).accentColor)),
              AdaptiveText(
                "Direction",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.0,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            //side: BorderSide(color: Colors.grey[500])
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Direction"),
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
        ),
        AdaptiveRaisedButton(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.bookmark_border,
                      size: 14, color: Theme.of(context).accentColor)),
              AdaptiveText(
                "Bookmark",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.0,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            //side: BorderSide(color: Colors.grey[500])
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Bookmark"),
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
        ),
        AdaptiveRaisedButton(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.share_outlined,
                      size: 14, color: Theme.of(context).accentColor)),
              AdaptiveText(
                "Share",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.0,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            //side: BorderSide(color: Colors.grey[500])
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Share"),
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
        ),
      ],
    );
  }
}
