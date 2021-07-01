import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/ColourIntensitySettings.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/ColourInversionSettings.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/currentThemeColours_widget.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/selectCustomTheme_widget.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/selectPredefinedTheme_widget.dart';
import 'package:flutter/material.dart';

class ColourThemesSettings extends StatelessWidget {
  const ColourThemesSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveText(
          "Colour Themes",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18),
        ),
        Table(
          border: TableBorder(
              bottom: BorderSide(
                  width: 1, color: Colors.grey, style: BorderStyle.solid),
              top: BorderSide(
                  width: 1, color: Colors.grey, style: BorderStyle.solid),
              right: BorderSide(
                  width: 1, color: Colors.grey, style: BorderStyle.solid),
              left: BorderSide(
                  width: 1, color: Colors.grey, style: BorderStyle.solid)),
          children: [
            TableRow(children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CurrentThemeColours(context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectPredefinedTheme(context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 150,
                        child: SelectCustomTheme(context: context)),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ColourIntensitySettings(context: context),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ColourInversionSettings(context: context),
                      )),
                ],
              )
            ])
          ],
        ),
      ],
    );
  }
}
