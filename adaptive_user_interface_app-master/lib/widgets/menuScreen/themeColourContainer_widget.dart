import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

// Returns simple container to display what color the theme is currently using.
class ThemeColourContainer extends StatelessWidget {
  const ThemeColourContainer({
    Key key,
    @required this.context,
    @required this.colorName,
    @required this.color,
  }) : super(key: key);

  final BuildContext context;
  final String colorName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 16),
      color: color,
      child: AdaptiveText(colorName,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.button),
    );
  }
}
