import 'package:adaptive_user_interface_app/viewModel/ColoursViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_user_interface_app/widgets/menuScreen/theme_button_widget.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'dart:math';

import 'package:provider/provider.dart';

// Returns simple container to display what color the theme is currently using.
class SelectCustomTheme extends StatefulWidget {
  const SelectCustomTheme({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _SelectCustomThemeState createState() => _SelectCustomThemeState();
}

class _SelectCustomThemeState extends State<SelectCustomTheme> {
  Color _textColor = Colors.white;
  ThemeData _customTheme = ThemeData(
      // Default initial colours to Black and Pink, to ensure that it is
      // colourblind friendly and has sufficient contrast on first load
      primaryColor: Color(0xFF000000),
      accentColor: Color(0xFFF66FDF),
      backgroundColor: Colors.white,
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.orange)));

  @override
  void initState() {
    super.initState();
    _customTheme =
        Provider.of<CustomColoursViewModel>(context, listen: false).getTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AdaptiveText(
          "Select Custom Theme",
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 4,
        ),
        AdaptiveText(
          "Choose your own colour scheme. Select your colours using the boxes, then click on the circle to activate it.",
          style: TextStyle(fontSize: 12, height: 1.1),
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: ThemeButton(buttonThemeData: _customTheme),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: AdaptiveText(
                          'Contrast Ratio = ' +
                              _calculateContrastRatio(_customTheme.primaryColor,
                                      _customTheme.accentColor)
                                  .toStringAsFixed(2),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      flex: 3,
                      child: AdaptiveText(
                          _checkSufficientContrast(_customTheme.primaryColor,
                              _customTheme.accentColor),
                          textAlign: TextAlign.center),
                    ),
                  ])),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: FlatButton(
                            onPressed: () => _openDialog("Primary Colour",
                                _customTheme.primaryColor, true),
                            color: _customTheme.primaryColor,
                            child: AdaptiveText("Choose Primary Colour",
                                textAlign: TextAlign.center,
                                style: _customTheme.primaryTextTheme.button)),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: FlatButton(
                            onPressed: () => _openDialog("Accent Colour",
                                _customTheme.accentColor, false),
                            color: _customTheme.accentColor,
                            child: AdaptiveText("Choose Accent Colour",
                                textAlign: TextAlign.center,
                                style: _customTheme.primaryTextTheme.button)),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: FlatButton(
                            onPressed: () =>
                                _openDialogTextColor("Text Colour", _textColor),
                            color: _customTheme.textTheme.bodyText2.color,
                            child: AdaptiveText("Choose Text Colour",
                                textAlign: TextAlign.center,
                                style: _customTheme.primaryTextTheme.button.merge(TextStyle(color:_customTheme.backgroundColor)))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  double _calculateContrastRatio(Color currentPrimary, Color currentAccent) {
    final double lumPrimary = currentPrimary.computeLuminance();
    final double lumAccent = currentAccent.computeLuminance();
    double brightest = max(lumPrimary, lumAccent);
    double darkest = min(lumPrimary, lumAccent);
    return (brightest + 0.05) / (darkest + 0.05);
  }

  String _checkSufficientContrast(Color currentPrimary, Color currentAccent) {
    final double currentContrast =
        _calculateContrastRatio(currentPrimary, currentAccent);
    final String feedback = (currentContrast >= 4.5)
        ? 'Contrast Ratio is '
            'Sufficient'
        : 'WARNING: Contrast Ratio should be above 4.5 to have '
            'sufficient contrast between colours';
    return feedback;
  }

  // Dialog to select colors for theme.
  void _openDialog(String title, Color currentColor, bool primaryColor) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: Container(
            height: 250,
            child: MaterialColorPicker(
              selectedColor: currentColor,
              onColorChange: (color) => setState(() => _customTheme =
                  (primaryColor)
                      ? _customTheme.copyWith(
                          primaryColor:
                              color) // copyWith only changes some of the properties
                      : _customTheme.copyWith(
                          accentColor:
                              color)), // if initial primary color is null make both the picked color?
              onMainColorChange: (color) => setState(() => _customTheme =
                  (primaryColor)
                      ? _customTheme.copyWith(primaryColor: color)
                      : _customTheme.copyWith(accentColor: color)),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: Theme.of(context).textTheme.button,
              ),
            )
          ],
        );
      },
    );
  }

  // Dialog to select colors for theme.
  void _openDialogTextColor(String title, Color currentColor) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: Container(
              height: 250,
              child: MaterialColorPicker(
                selectedColor: currentColor,
                onColorChange: (color) =>
                    setState(() => _customTheme = _customTheme.copyWith(
                            textTheme: TextTheme(
                          bodyText2: TextStyle(color: color),
                          button: TextStyle(color: color),
                        ))),
                onMainColorChange: (color) =>
                    setState(() => _customTheme = _customTheme.copyWith(
                            textTheme: TextTheme(
                          bodyText2: TextStyle(color: color),
                          button: TextStyle(color: color),
                        ))),
              )),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: Theme.of(context).textTheme.button,
              ),
            )
          ],
        );
      },
    );
  }
}
