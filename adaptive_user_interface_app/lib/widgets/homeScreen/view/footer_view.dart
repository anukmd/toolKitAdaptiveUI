import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import '../size_helpers.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveLink.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveFlatButton.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 438,
        //width: 1064,
        color: Color(0XFFf8f8f8).withOpacity(0.5),
        padding: EdgeInsets.only(bottom: 22, top: 48),
        alignment: Alignment.center,
        child: Column(
          children: [
            LanguageBar(),
            FooterMenu(),
          ],
        ));
  }
}

class LanguageBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38,
        width: displayWidth(context) * 80,
        margin: EdgeInsets.only(bottom: 40),
        alignment: Alignment.center,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SizedBox(
                //height: 90,
                width: 200,
                child: Text(
                  'zomato',
                  style: TextStyle(
                      //fontFamily: 'Metropolis',
                      fontSize: 40,
                      color: Theme.of(context).textTheme.headline4.color,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Dropdown(
                title: "country",
                dropdownItems: [
                  ListItem(1, "Australia"),
                  ListItem(2, "India"),
                  ListItem(3, "USA"),
                  ListItem(4, "UK")
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Dropdown(
                title: "language",
                dropdownItems: [
                  ListItem(1, "English"),
                  ListItem(2, "Chinese"),
                  ListItem(3, "Japanese"),
                  ListItem(4, "French")
                ],
              ),
            ],
          ),
        ]));
  }
}

class FooterMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //width: 1060,
        width: displayWidth(context) * 80,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyLinks(),
              FoodiesLinks(),
              RestaurantLinks(),
              ForYouLinks(),
              SocialLinks(),
            ]));
  }
}

class SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 169,
      child: Column(children: [
        AdaptiveText(
          "SOCIAL LINKS",
          style: TextStyle(color: Theme.of(context).textTheme.headline4.color
              //Color(0xFF000000)
              ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.email),
              color: Theme.of(context).accentColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: new AdaptiveText("Email"),
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
            IconButton(
              icon: Icon(Icons.android_outlined),
              color: Theme.of(context).accentColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: new AdaptiveText("Android"),
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
            IconButton(
              icon: Icon(Icons.apps_outlined),
              color: Theme.of(context).accentColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: new AdaptiveText("Social Media"),
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
          ],
        ),
        Column(children: [
          AdaptiveFlatButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Apple"),
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
            child: AdaptiveText("Apple"),
          ),
          AdaptiveFlatButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Google Play"),
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
            child: AdaptiveText("Google Play"),
          ),
        ])
      ]),
    );
  }
}

class CompanyLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 190,
        //width: 150,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: AdaptiveText("COMPANY",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .headline4
                        .color //Color(0xFF000000)
                    )),
            margin: EdgeInsets.only(bottom: 12)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("About",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/who-we-are"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Blog",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/blog/"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Careers",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/careers"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Report Fraud",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/report-fraud"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Contact",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/contact"),
          ),
        ])
      ],
    ));
  }
}

class FoodiesLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 173,
        //width: 150,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: AdaptiveText("FOR FOODIES",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .headline4
                        .color //Color(0xFF000000)
                    )),
            margin: EdgeInsets.only(bottom: 12)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Code of Conduct",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/policies"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Community",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://community.zomato.com/"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Blogger Help",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/bloggers"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Developers",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://developers.zomato.com/"),
          ),
        ])
      ],
    ));
  }
}

class RestaurantLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 173,
        //width: 150,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: AdaptiveText("FOR RESTAURANT",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .headline4
                        .color //Color(0xFF000000)
                    )),
            margin: EdgeInsets.only(bottom: 12)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Add Restaurant",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/addrestaurant"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Claim your listing",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/business"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Business App",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/business/apps"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Restaurant Widgets",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/business/widgets"),
          ),
        ])
      ],
    ));
  }
}

class ForYouLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 173,
        //width: 150,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: AdaptiveText("FOR YOU",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .headline4
                        .color //Color(0xFF000000)
                    )),
            margin: EdgeInsets.only(bottom: 12)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Privacy",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/privacy"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Terms",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/conditions"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Security",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/security"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: AdaptiveLink(
                child: AdaptiveText("Sitemap",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline4
                            .color //Color(0xFF696969)
                        )),
                url: "https://www.zomato.com/directory"),
          ),
        ])
      ],
    ));
  }
}

class Dropdown extends StatefulWidget {
  final String title;
  final List<ListItem> dropdownItems;
  Dropdown({Key key, this.title, this.dropdownItems}) : super(key: key);
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
//List<ListItem> _dropdownItems = list;

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(widget.dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: AdaptiveText(listItem.name,
              style: TextStyle(color: Color(0xFF1c1c1c))),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), border: Border.all()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<ListItem>(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              }),
        ));
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
