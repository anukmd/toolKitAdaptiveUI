import 'package:adaptive_user_interface_app/screens/AccessibilityMenuScreen.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import './size_helpers.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        padding: EdgeInsets.symmetric(vertical: 17),
        width: displayWidth(context) * 90,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      _openDialog(context);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        title: new AdaptiveText("Get the App"),
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
                  child: AdaptiveText(
                    "Get the app",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                )
              ]),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                          backgroundColor: Theme.of(context).backgroundColor,
                          title: new AdaptiveText("Login"),
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
                    child: _NavBarItem('Login')),
                SizedBox(
                  width: 60,
                ),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                          backgroundColor: Theme.of(context).backgroundColor,
                          title: new AdaptiveText("Sign Up"),
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
                    child: _NavBarItem('Signup')),
              ],
            )
          ],
        ));
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

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveText(
      title,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).textTheme.bodyText1.color,
      ),
    );
  }
}
