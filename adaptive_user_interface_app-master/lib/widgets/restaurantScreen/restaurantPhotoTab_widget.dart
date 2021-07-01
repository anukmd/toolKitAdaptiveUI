import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveColorFilter.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveRaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class RestaurantPhotoTab extends StatelessWidget {
  BuildContext _context;
  //Spacing needs work
  Widget build(BuildContext context) {
    _context = context;
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8),
      AdaptiveText(
        "McDonald's Photos",
        style: TextStyle(
          fontSize: 24,
          letterSpacing: 1.0,
          color: Theme.of(context).textTheme.bodyText2.color,
          //fontWeight: FontWeight.bold
        ),
      ),
      Row(children: [
        Container(
          padding: EdgeInsets.all(8),
          child: AdaptiveRaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: AdaptiveText(
              "All (28)",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.0,
                color: Theme.of(context).textTheme.headline1.color,
              ),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("All"),
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
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: AdaptiveRaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: AdaptiveText(
              "Food (21)",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.0,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Food"),
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
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: AdaptiveRaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: AdaptiveText(
              "Ambience (1)",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1.0,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: new AdaptiveText("Ambience"),
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
        ),
      ]),

      //Definitely not ideal but im lazy lol
      getGalleryRow(),
      Spacer(flex: 10)
    ]));
  }

  Expanded getGalleryRow() {
    int numPhotos = 5;
    int numRows = 5;

    List<Row> photoRowList = List<Row>();
    var imageList = [
      "assets/images/BigMac.jpeg",
      "assets/images/ChickenNuggets.jpeg",
      'images/mcdonalds_3.png',
      'images/mcdonalds_1.png',
      'images/mcdonalds_2.png',
      'images/mcdonalds_5.png',
      'images/mcdonalds_4.png',
      'images/mcdonalds_6.png',
      'images/mcdonalds_7.png',
      'images/mcdonalds_8.png'
    ];

    for (int x = 0; x < numRows; x++) {
      List<Widget> currentPhotoRow = List<Widget>();
      for (int i = 0; i < numPhotos; i++) {
        int index = Random().nextInt(9); //+ 1;
        currentPhotoRow.add(Expanded(
          flex: 1,
          child: Container(
            height: 186,
            width: 200,
            padding: const EdgeInsets.all(4.0),
            child: Provider.of<AdaptiveWidgetsViewModel>(_context)
                    .getImageColorFilterToggle
                ? ColorFiltered(
                    colorFilter:
                        AdaptiveColorFilter.getAdaptiveColorFilter(_context),
                    child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          imageList[index],
                        )),
                  )
                : Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      imageList[index],
                    )),
          ),
        ));
      }
      photoRowList.add(Row(children: currentPhotoRow));
    }

    return Expanded(
      flex: 10,
      child: Container(child: Column(children: photoRowList)),
    );
  }
}
