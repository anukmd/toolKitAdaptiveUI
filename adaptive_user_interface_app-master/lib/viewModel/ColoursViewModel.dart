import 'package:adaptive_user_interface_app/themes/theme_values.dart';
import 'package:flutter/material.dart';

class CustomColoursViewModel with ChangeNotifier {
  ThemeData _themeData = blueTheme;
  ThemeData _orignalIntensityThemeData;
  bool _isInverted = false;

  CustomColoursViewModel(this._themeData);

  ThemeData get getTheme {
    return _themeData;
  }

  void setTheme(ThemeData themeData) async {
    //reset colour intensity
    _colourIntensity = 0;
    _orignalIntensityThemeData = null;
    //update with new theme
    setNewTheme(themeData);
    notifyListeners();
  }

  void setNewTheme(ThemeData updateThemeData) {
    if (_isInverted) {
      _updateInvertedThemeColours(updateThemeData);
    } else {
      _themeData = updateThemeData;
    }
  }

  double _colourIntensity = 0.0;
  double get getColourIntensity {
    return _colourIntensity;
  }

  void updateColourIntensityValue(double newValue) {
    _colourIntensity = newValue;
    if (_orignalIntensityThemeData == null) {
      _orignalIntensityThemeData = _themeData;
    }
    _updateThemeColourIntensity();
    notifyListeners();
  }

  void _updateThemeColourIntensity() {
    Color _updatedPrimaryColor = _calculateUpdatedColourIntensityValue(
        _orignalIntensityThemeData.primaryColor);
    Color _updatedAccentColor = _calculateUpdatedColourIntensityValue(
        _orignalIntensityThemeData.accentColor);
    Color _updatedTextColor = _calculateUpdatedColourIntensityValue(
        _orignalIntensityThemeData.textTheme.bodyText2.color);
    Color _updateBackgroundColor = _calculateUpdatedColourIntensityValue(
        _orignalIntensityThemeData.backgroundColor);

    ThemeData _updatedTheme = ThemeData(
        primaryColor: _updatedPrimaryColor,
        accentColor: _updatedAccentColor,
        backgroundColor: _updateBackgroundColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: _updatedTextColor)));
    setNewTheme(_updatedTheme);
  }

  Color _calculateUpdatedColourIntensityValue(Color inputColour) {
    var hslValues = HSLColor.fromColor(inputColour);
    double hueValue = hslValues.hue;
    double saturationValue = hslValues.saturation + (_colourIntensity * 0.01);
    double lightnessValue = hslValues.lightness - (_colourIntensity * 0.01);
    // Check to see if saturation value is within HSL bounds
    if (saturationValue > 1) {
      saturationValue = 1;
    }
    if (lightnessValue < 0) {
      lightnessValue = 0;
    }

    return HSLColor.fromAHSL(1, hueValue, saturationValue, lightnessValue)
        .toColor();
  }

  bool get getIsInverted {
    return _isInverted;
  }

  void toggleColourInverted() {
    _isInverted = !_isInverted;
    _updateInvertedThemeColours(_themeData);
    notifyListeners();
  }

  void _updateInvertedThemeColours(ThemeData theme) {
    Color _updatedPrimaryColor =
        _calculateInvertedColourValue(theme.primaryColor);
    Color _updatedAccentColor =
        _calculateInvertedColourValue(theme.accentColor);
    Color _updateBackgroundColor =
        _calculateInvertedColourValue(theme.backgroundColor);
    Color _updatedTextColor =
        _calculateInvertedColourValue(theme.textTheme.bodyText2.color);

    ThemeData _updatedTheme = ThemeData(
        primaryColor: _updatedPrimaryColor,
        accentColor: _updatedAccentColor,
        backgroundColor: _updateBackgroundColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: _updatedTextColor)));
    _themeData = _updatedTheme;
  }

  Color _calculateInvertedColourValue(Color inputColour) {
    var hslValues = HSLColor.fromColor(inputColour);
    double hueValue = hslValues.hue;
    double saturationValue =
        hslValues.saturation; //saturation stays the same in inversions
    double lightnessValue = hslValues.lightness;
    double hueInverted = (hueValue + 180) % 360;
    double lightnessInverted = 1 - lightnessValue;

    return HSLColor.fromAHSL(1, hueInverted, saturationValue, lightnessInverted)
        .toColor();
  }
}
