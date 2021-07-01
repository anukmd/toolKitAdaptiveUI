import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String title;
  final String followers;
  final String reviews;
  UserCard({Key key, this.title, this.followers, this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 74,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/usericon.png'),
                )),
          ),
          Expanded(
            flex: 2,
            //height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AdaptiveText(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                ),
                Flexible(
                  child: AdaptiveText(
                    '$followers followers $reviews reviews',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.login_outlined,
                size: 24, color: Theme.of(context).accentColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Navigate"),
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
          )
        ]));
  }
}
