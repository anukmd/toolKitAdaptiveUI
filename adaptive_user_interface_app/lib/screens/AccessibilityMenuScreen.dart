import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/ImageFilterSettings.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/ColourThemesSettings.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/FontSettings.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/ColorSettings.dart';

class AccessibilityMenuScreen extends StatefulWidget {
  AccessibilityMenuScreen();

  @override
  _AccessibilityMenuScreenState createState() =>
      _AccessibilityMenuScreenState();
}

class _AccessibilityMenuScreenState extends State<AccessibilityMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: AdaptiveText('Accessibility Menu'),
            leading: IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(

        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(16),
            child: Column(children: [
              ColourThemesSettings(),
              SizedBox(
                height: 8,
              ),
              FontSettings(context: context),
              SizedBox(
                height: 8,
              ),
              ImageFilterSettings(context:context),
              ColorSettings(context: context),
            ]))));
  }

}

