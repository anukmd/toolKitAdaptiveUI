import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/theme_button_widget.dart';
import 'package:adaptive_user_interface_app/themes/theme_values.dart';

// Returns simple container to display what color the theme is currently using.
class SelectPredefinedTheme extends StatelessWidget {
  const SelectPredefinedTheme({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveText(
          "Select Pre-defined Themes",
        ),
        SizedBox(height: 4),
        AdaptiveText(
          "Choose from preselected colour vision deficiency friendly themes. Click on the circle to select. Selected theme is marked with an ✓.",
          style: TextStyle(fontSize: 12, height: 1.1),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ThemeButton(buttonThemeData: proTheme),
                    AdaptiveText(
                      "Red Light Deficiency",
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ThemeButton(buttonThemeData: deutTheme),
                    AdaptiveText("Green Light Deficiency"),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ThemeButton(buttonThemeData: triTheme),
                    AdaptiveText("Blue Light Deficiency"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ThemeButton(buttonThemeData: monoTheme),
                    AdaptiveText("Total Colourblindness"),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
