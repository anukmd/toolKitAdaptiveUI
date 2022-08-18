import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/homeScreen/locationwidget.dart';

class FullLocationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1100,
        margin: EdgeInsets.only(bottom: 100),
        child: Column(children: [
          Container(
              child: AdaptiveText(
                "Popular localities in and around Melbourne",
                style: TextStyle(
                    fontSize: 48,
                    color: Theme.of(context).textTheme.bodyText2.color),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(bottom: 40)),
          LocationTable(),
        ]));
  }
}

class LocationTable extends StatelessWidget {
  const LocationTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Table(children: [
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Fitzroy (159 places)",
                  url: "https://www.zomato.com/melbourne/fitzroy-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Richmond (359 places)",
                  url: "https://www.zomato.com/melbourne/richmond-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Brunswick (279 places)",
                  url:
                      "https://www.zomato.com/melbourne/brunswick-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Camberwell (129 places)",
                  url:
                      "https://www.zomato.com/melbourne/camberwell-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Preston (283 places)",
                  url: "https://www.zomato.com/melbourne/preston-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Clayton (172 places)",
                  url: "https://www.zomato.com/melbourne/clayton-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Windsor (293 places)",
                  url: "https://www.zomato.com/melbourne/windsor-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Collingwood (303 places)",
                  url:
                      "https://www.zomato.com/melbourne/collingwood-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Brighton (123 places)",
                  url: "https://www.zomato.com/melbourne/brighton-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Doncaster East (137 places)",
                  url: "https://www.zomato.com/melbourne/doncaster-east-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Prahan (108 places)",
                  url: "https://www.zomato.com/melbourne/prahan-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Frankston (115 places)",
                  url:
                      "https://www.zomato.com/melbourne/frankston-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Carnegie (142 places)",
                  url: "https://www.zomato.com/melbourne/carnegie-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Docklands (204 places)",
                  url:
                      "https://www.zomato.com/melbourne/docklands-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Springvale (102 places)",
                  url:
                      "https://www.zomato.com/melbourne/springvale-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Footscray (82 places)",
                  url:
                      "https://www.zomato.com/melbourne/footscray-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Box Hill (122 places)",
                  url: "https://www.zomato.com/melbourne/box-hill-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Carlton (163 places)",
                  url:
                      "https://www.zomato.com/melbourne/carlton-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "South Melbourne (128 places)",
                  url:
                      "https://www.zomato.com/melbourne/south-melbourne-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Northcote (199 places)",
                  url:
                      "https://www.zomato.com/melbourne/northcote-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "South Yarra (196 places)",
                  url:
                      "https://www.zomato.com/melbourne/south-yarra-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Elsternwick (215 places)",
                  url:
                      "https://www.zomato.com/melbourne/elsternwick-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "St Kilda (285 places)",
                  url: "https://www.zomato.com/melbourne/st-kilda-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20, left: 13),
              child: LocationWidget(
                  title: "Southbank (123 places)",
                  url:
                      "https://www.zomato.com/melbourne/southbank-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 20, right: 13),
              child: LocationWidget(
                  title: "Ringwood (238 places)",
                  url: "https://www.zomato.com/melbourne/ringwood-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Moonee Ponds (259 places)",
                  url:
                      "https://www.zomato.com/melbourne/moonee-ponds-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20, left: 13),
              child: LocationWidget(
                  title: "Coburg (190 places)",
                  url: "https://www.zomato.com/melbourne/coburg-restaurants"),
            ),
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 13),
              child: LocationWidget(
                  title: "Balwyn (148 places)",
                  url: "https://www.zomato.com/melbourne/balwyn-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6.5, right: 6.5),
              child: LocationWidget(
                  title: "Hawthorn (339 places)",
                  url: "https://www.zomato.com/melbourne/hawthorn-restaurants"),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 13),
              child: LocationWidget(
                  title: "Glen Waverley (175 places)",
                  url:
                      "https://www.zomato.com/melbourne/glen-waverley-restaurants"),
            ),
          ]),
        ]));
  }
}
