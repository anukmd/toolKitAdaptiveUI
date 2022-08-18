import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/themeColourContainer_widget.dart';

// Returns simple container to display what color the theme is currently using.
class CurrentThemeColours extends StatelessWidget {
  const CurrentThemeColours({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        AdaptiveText(
          "Current Theme Colours",
        ),
        SizedBox(height: 4),
        AdaptiveText(
          "These boxes show the current selected theme colours.",
          style: TextStyle(fontSize: 12),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ThemeColourContainer(
              context: context,
              colorName: "Primary Colour",
              color: Theme.of(context).primaryColor),
          ThemeColourContainer(
              context: context,
              colorName: "Accent Colour",
              color: Theme.of(context).accentColor),
        ])
      ],
    );
  }
}
