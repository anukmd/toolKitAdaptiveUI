import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/navbar.dart';
import '../size_helpers.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveTextField.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: displayWidth(context) * 100,
        margin: EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
            image: DecorationImage(
                // colorFilter: AdaptiveColorFilter.getAdaptiveColorFilter(context),
                image: AssetImage("images/header_background.jpeg"),
                fit: BoxFit.cover)),
        height: 521,
        child: Column(
          children: [
            MyNavigationBar(),
            Container(
                child: AdaptiveText(
                  'zomato',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 78,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                ),
                padding: EdgeInsets.all(24)),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: AdaptiveText(
                "Discover the best food & drinks in Melbourne, VIC",
                style: TextStyle(
                    fontSize: 36, color: Colors.white //Color(0XFFffffff)
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            FullSearchBar(),
          ],
        ));
  }
}

class FullSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width:
            (displayWidth(context) > 7.76) ? 776 : displayWidth(context) * 90,
        height: 54,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SearchBar());
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: AdaptiveTextField(
                context,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color),
                decoration: InputDecoration(
                  hintText: "Location",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.bodyText2.color),
                  prefixIcon:
                      Icon(Icons.place, color: Theme.of(context).accentColor),
                ),
              )),
          SizedBox(
              width: 30,
              child: Text(
                '|',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w100),
              )),
          Flexible(
            flex: 2,
            child: AdaptiveTextField(
              context,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyText2.color),
              decoration: InputDecoration(
                hintText: "Search for a restaurant, cuisine or dish",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color),
                suffixIcon:
                    Icon(Icons.search, color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
