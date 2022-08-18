import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveLink.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/usercard.dart';
import '../size_helpers.dart';

class FullLeaderboardPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = displayWidth(context) > 7.76;
    if (isScreenWide) {
      return Container(
          height: 544,
          margin: EdgeInsets.only(bottom: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: AdaptiveText("Leaderboard",
                  style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).textTheme.bodyText2.color)),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: LeaderboardPanel(
                  title: "Reviewers",
                )),
                SizedBox(width: 10),
                Expanded(
                    child: LeaderboardPanel(
                  title: "Photographers",
                )),
                SizedBox(width: 10),
                Expanded(
                    child: LeaderboardPanel(
                  title: "Bloggers",
                )),
              ],
            ))
          ]));
    } else {
      return Container(
          margin: EdgeInsets.only(bottom: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: AdaptiveText("Leaderboard",
                  style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).textTheme.bodyText2.color)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeaderboardPanel(
                    title: "Reviewers", panelWidth: displayWidth(context) * 42),
                SizedBox(width: 10),
                LeaderboardPanel(
                    title: "Photographers",
                    panelWidth: displayWidth(context) * 42),
              ],
            ),
            SizedBox(height: 10),
            LeaderboardPanel(
                title: "Bloggers", panelWidth: displayWidth(context) * 42),
          ]));
    }
  }
}

class LeaderboardPanel extends StatelessWidget {
  final String title;
  double panelWidth;
  LeaderboardPanel({Key key, this.title, this.panelWidth}) : super(key: key);

  Widget build(BuildContext context) {
    String url;
    if (panelWidth == null) {
      panelWidth = displayWidth(context) * 28;
    }
    if (title == "Reviewers") {
      url = "https://www.zomato.com/melbourne/leaderboard";
    }
    if (title == "Photographers") {
      url = "https://www.zomato.com/melbourne/top-food-photographers";
    }
    if (title == "Bloggers") {
      url = "https://www.zomato.com/melbourne/top-food-bloggers";
    }

    return Container(
        height: 467,
        width: panelWidth,
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0XFFE8E8E8), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveText(
              'Top $title in Melbourne',
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2 /*.headline2*/ .color),
            ),
            UserCard(
              title: "User1",
              followers:"2.0K",
              reviews: "1.7K",
            ),
            UserCard(
              title: "User2",
              reviews: "886",
              followers: "454",
              
            ),
            UserCard(
              title: "User3",
              followers: "3.4K",
              reviews: "440",
            ),
            UserCard(
              title: "User4",
              followers: "2.3K",
              reviews: "2.0K",
            ),
            UserCard(
              title: "User5",
              followers: "2.1K",
              reviews: "1.7K",
            ),
            AdaptiveLink(
                child: AdaptiveText('$title Leaderboard',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).accentColor)),
                url: url),
          ],
        ));
  }
}
