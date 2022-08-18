import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveFlatButton.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:provider/provider.dart';
import '../size_helpers.dart';

class GetAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        color: Color(0XFFfffbf7),
        child: Container(
            height: 450,
            width: displayWidth(context) * 100,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Provider.of<AdaptiveWidgetsViewModel>(context)
                    .getImageColorFilterToggle)
                  ColorFiltered(
                      colorFilter:
                          AdaptiveColorFilter.getAdaptiveColorFilter(context),
                      child: Image.asset(
                        'images/app.png',
                        width: displayWidth(context) * 20,
                      ))
                else
                  Image.asset(
                    'images/app.png',
                    width: displayWidth(context) * 20,
                  ),
                Container(
                    height: 350,
                    width: displayWidth(context) * 40,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: AdaptiveText("Get the Zomato App",
                                style: TextStyle(
                                    fontSize: 44,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .color //Color(0XFF1c1c1c)
                                    )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: AdaptiveText(
                                "We will send you a link, open it on your phone to download the app",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .color)),
                          ),
                          RegistrationRadioOption(),
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: displayWidth(context) * 25,
                                    height: 48,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: AdaptiveFlatButton(
                                          height: 48,
                                          minWidth: displayWidth(context) * 5,
                                          color: Theme.of(context).accentColor,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
                                                title: new AdaptiveText(
                                                    "Share App Link"),
                                                content: new AdaptiveText(
                                                    "Consider this action as a success!"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: AdaptiveText(
                                                        'Close me!'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          child: AdaptiveText(
                                            "Share App Link",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    .color),
                                          ))),
                                ],
                              )),
                          Flexible(
                            //margin: EdgeInsets.only(bottom: 15),
                            child: AdaptiveText("Download app from",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .color)),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AdaptiveFlatButton(
                                  child: AdaptiveText("Apple"),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => new AlertDialog(
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        title: new AdaptiveText("Apple"),
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
                                AdaptiveFlatButton(
                                  child: AdaptiveText("Android"),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => new AlertDialog(
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        title: new AdaptiveText("Android"),
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
                              ])
                        ]))
              ],
            )));
  }
}

enum Options { email, mobile }

class RegistrationRadioOption extends StatefulWidget {
  RegistrationRadioOption({Key key}) : super(key: key);

  @override
  _RegistrationRadioOptionState createState() =>
      _RegistrationRadioOptionState();
}

class _RegistrationRadioOptionState extends State<RegistrationRadioOption> {
  Options _option = Options.email;

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          value: Options.email,
          groupValue: _option,
          activeColor: Theme.of(context).accentColor,
          onChanged: (Options value) {
            setState(() {
              _option = value;
            });
          },
        ),
        AdaptiveText('Email',
            style:
                TextStyle(color: Theme.of(context).textTheme.headline4.color)),
        Radio(
          value: Options.mobile,
          groupValue: _option,
          activeColor: Theme.of(context).accentColor,
          onChanged: (Options value) {
            setState(() {
              _option = value;
            });
          },
        ),
        AdaptiveText('Mobile',
            style:
                TextStyle(color: Theme.of(context).textTheme.headline4.color)),
      ],
    );
  }
}
