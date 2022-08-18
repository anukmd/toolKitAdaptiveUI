import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/screens/AccessibilityMenuScreen.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveTextField.dart';

import 'package:flutter/material.dart';

class ZomatoAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 17),
      width: queryData.size.width * 0.8,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: () {
              _openDialog(context);
            },
          ),
        ),
        AdaptiveText(
          'zomato',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Metropolis',
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0,
            color: Theme.of(context).textTheme.bodyText2.color,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0XFFE8E8E8)),
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: AdaptiveTextField(
                        context,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2.color),
                        decoration: InputDecoration(
                          hintText: "Location",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color),
                          prefixIcon: Icon(Icons.place,
                              color: Theme.of(context).accentColor),
                        ),
                      )),
                  SizedBox(
                      width: 30,
                      child: Text(
                        '|',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Metropolis',
                            color: Colors.grey[350],
                            fontWeight: FontWeight.w100),
                      )),
                  Flexible(
                    flex: 2,
                    child: AdaptiveTextField(
                      context,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2.color),
                      decoration: InputDecoration(
                        hintText: "Search for a restaurant, cuisine or dish",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Theme.of(context).textTheme.bodyText2.color),
                        suffixIcon: Icon(Icons.search,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Login"),
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
          child: AdaptiveText(
            "Login",
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                title: new AdaptiveText("Sign up"),
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
          child: AdaptiveText(
            'Signup',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
        )
      ]),
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: AccessibilityMenuScreen()),
        );
      },
    );
  }
}
