import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveRaisedButton.dart';

class ZomatoUserReview extends StatelessWidget {
  ZomatoUserReview(this.reviewScore);
  final int reviewScore;

  @override
  Widget build(BuildContext context) {
    List<Widget> reviewLine = List<Widget>();

    //Filled in Stars
    for (int i = 0; i < reviewScore; i++) {
      reviewLine.add(Icon(Icons.star));
    }
    //Empty stars
    for (int i = 0; i < (5 - reviewScore); i++) {
      reviewLine.add(Icon(Icons.star_border_outlined));
    }
    //Review Score
    reviewLine.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: AdaptiveText(
        reviewScore.toString(),
        style: TextStyle(
            fontSize: 16,
            letterSpacing: 1.0,
            color: Colors.black,
            fontWeight: FontWeight.w400),
      ),
    ));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
                padding: EdgeInsets.all(8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(image: AssetImage('images/usericon.png'))),
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdaptiveText(
                      "User Name",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.0,
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontWeight: FontWeight.w400),
                    ),
                    AdaptiveText(
                      "3 Reviews · 0 Followers",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1.0,
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
            Spacer(flex: 3),
            AdaptiveRaisedButton(
              child: AdaptiveText(
                "Follow",
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      width: 1, color: Theme.of(context).accentColor)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: new AdaptiveText("Follow"),
                    content:
                        new AdaptiveText("Consider this action as a success!"),
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
          ]),
          //Review stars
          Row(
            children: reviewLine,
          ),
          //Review comments
          Flexible(
              flex: 5,
              child: Container(
                child: AdaptiveText(
                  'Here is my review about the food. Here is my review about the food. Here is my review about the food. Here is my review about the food. Here is my review about the food. Here is my review about the food. Here is my review about the food.',
                  textAlign: TextAlign.left,
                  //overflow: TextOverflow.ellipsis,
                  //maxLines: 3,
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.bodyText2.color,
                      fontWeight: FontWeight.w400),
                ),
              )),

          // Number of likes and comments
          Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: AdaptiveText(
                  "0 Likes, 0 Comments",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.bodyText2.color,
                      fontWeight: FontWeight.w400),
                ),
              )),

          //Like Comment Share Button

          Row(
            children: [
              FlatButton(
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.thumb_up_alt_outlined,
                            size: 15,
                            color:
                                Theme.of(context).textTheme.bodyText2.color)),
                    AdaptiveText(
                      "Like",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                  ],
                ),
                // color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                      backgroundColor: Theme.of(context).backgroundColor,
                      title: new AdaptiveText("Like"),
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
              FlatButton(
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.comment_outlined,
                            size: 15,
                            color:
                                Theme.of(context).textTheme.bodyText2.color)),
                    AdaptiveText(
                      "Comment",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                  ],
                ),
                // color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                      backgroundColor: Theme.of(context).backgroundColor,
                      title: new AdaptiveText("Comment"),
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
              FlatButton(
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.share_outlined,
                            size: 15,
                            color:
                                Theme.of(context).textTheme.bodyText2.color)),
                    AdaptiveText(
                      "Share",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                  ],
                ),
                // color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                      title: new AdaptiveText("Share"),
                      content: new AdaptiveText("Shared!"),
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

          //  Divider(
          //   color: Colors.grey,
          //   height: 15,
          //   thickness: 1,
          //   indent: 0,
          //   endIndent: 0,
          // ),
        ],
      ),
    );
  }
}
