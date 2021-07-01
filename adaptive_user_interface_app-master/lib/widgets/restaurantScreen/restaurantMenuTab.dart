import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantMenuTab extends StatelessWidget {
  //Spacing needs work
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8),
      AdaptiveText(
        "McDonald's Menu",
        style: TextStyle(
          fontSize: 24,
          letterSpacing: 1.0,
          color: Theme.of(context).textTheme.bodyText2.color,
          //fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 25),
      Row(children: [
        Menu(title: "Food", pages: "20"),
        Menu(title: "Beverages", pages: "5"),
      ]),
    ]));
  }
}

class Menu extends StatelessWidget {
  final String title;
  final String pages;
  Menu({Key key, this.title, this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Hello"),
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
            child: Container(
              width: 250,
              height: 210,
              child: Provider.of<AdaptiveWidgetsViewModel>(context)
                      .getImageColorFilterToggle
                  ? ColorFiltered(
                      colorFilter:
                          AdaptiveColorFilter.getAdaptiveColorFilter(context),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/BigMac.jpeg'),
                      ),
                    )
                  : Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/BigMac.jpeg'),
                    ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0XFFE8E8E8)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          AdaptiveText(
            title,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1.0,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          AdaptiveText(
            pages + " pages",
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.0,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
        ]));
  }
}
