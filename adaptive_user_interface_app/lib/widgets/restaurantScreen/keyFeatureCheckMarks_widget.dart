import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class KeyFeatureCheckMarks extends StatelessWidget {
  
  KeyFeatureCheckMarks(BuildContext context, this.keyFeatures);
  List<String> keyFeatures;

  @override
  Widget build(BuildContext context) {
    List<Row> checkMarksLeft = new List<Row>();
    List<Row> checkMarksRight = new List<Row>();
    int half= keyFeatures.length~/2;

    for (int i=0; i<keyFeatures.length; i++) {
      Row featureCheckMark = Row(
        children: [
          Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.check_circle_outline,
                size: 20,
                color: Theme.of(context).textTheme.overline.color,
              )),
          AdaptiveText(
            keyFeatures[i],
            style: TextStyle(
                fontSize: 14,
                //letterSpacing: 1.0,
                //color: Theme.of(context).textTheme.bodyText1.color,
                //fontWeight: FontWeight.w200
                ),
          ),
        ],
      );
      if (i<half){
        checkMarksLeft.add(featureCheckMark);
      }
      else{
        checkMarksRight.add(featureCheckMark);
      }
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //Left Column
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: checkMarksLeft,
      ),
      //Right Column
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: checkMarksRight,
      )
    ]);
  }
}
