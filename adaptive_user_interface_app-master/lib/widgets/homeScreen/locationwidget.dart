import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveOutlinedButton.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({
    Key key,
    this.title,
    this.url,
  }) : super(key: key);
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: AdaptiveOutlinedButton(
            style: AdaptiveOutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                side: BorderSide(
                    color: Color(0XFFE8E8E8), style: BorderStyle.solid),
                primary: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .color //Theme.of(context).textTheme.headline5.color,
                ),
            onPressed: () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: AdaptiveText(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_forward,
                    )),
              ],
            )));
  }
}
