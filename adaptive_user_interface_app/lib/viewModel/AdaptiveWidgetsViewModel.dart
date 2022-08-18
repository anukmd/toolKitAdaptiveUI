import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveWidgetsViewModel extends ChangeNotifier {
  bool _boldTextOverride = false;
  bool get getBoldTextOverride {
    return _boldTextOverride;
  }

  bool _underlineTextStyle = false;
  bool get getUnderlineTextStyle {
    return _underlineTextStyle;
  }

  void toggleBoldTextOverride() {
    _boldTextOverride = !_boldTextOverride;
    notifyListeners();
  }

  void toggleUnderlineTextStyleStatus() {
    _underlineTextStyle = !_underlineTextStyle;
    notifyListeners();
  }

  bool _dyslexicFontOverride = false;
  bool get getDyslexicFontOverride {
    return _dyslexicFontOverride;
  }

  void toggleDyslexicFontOverride() {
    _dyslexicFontOverride = !_dyslexicFontOverride;
    notifyListeners();
  }

  double _fontSize = 3.0;
  double get getFontSize {
    return _fontSize;
  }

  void updateFontSize(double newValue) {
    _fontSize = newValue;
    notifyListeners();
  }

  bool _differentiateWithoutColor = false;

  bool get getDifferentiateWithoutColor {
    return _differentiateWithoutColor;
  }

  void toggleDifferentiateWithoutColor() {
    _differentiateWithoutColor = !_differentiateWithoutColor;
    notifyListeners();
  }

  bool _imageColorFilterToggle = false;

  bool get getImageColorFilterToggle {
    return _imageColorFilterToggle;
  }
  Color _imageFilterColor = Colors.blue;
  Color _orignalImageFilterColor = Colors.blue;
  
  Color get getImageFilterColor {
    return _imageFilterColor;
  }

  void toggleImageColorFilter( Color selectedColor) {
    _imageColorFilterToggle = !_imageColorFilterToggle;
    _imageFilterColor = selectedColor;
    _orignalImageFilterColor = selectedColor;
    notifyListeners();
  }
 void setImageColourFilter(Color selectedColor){
    _colourImageFilterIntensity = 0;
    _orignalImageFilterColor= selectedColor;
    updateImageColourFilter(selectedColor);
    notifyListeners();
 }
 void updateImageColourFilter(Color selectedColor){
  _imageFilterColor = selectedColor;
 }

  double _colourImageFilterIntensity = 0.0;
  double get getColourFilterImageIntensity {
    return _colourImageFilterIntensity;
  }

  void updateImageColourFilterIntensityValue(double newValue) {
    _colourImageFilterIntensity = newValue;
    

    Color _updatedColour=_calculateUpdatedColourIntensityValue(_orignalImageFilterColor);
    updateImageColourFilter(_updatedColour);
    notifyListeners();
  }

  Color _calculateUpdatedColourIntensityValue(Color inputColour) {
    var hslValues = HSLColor.fromColor(inputColour);
    double hueValue = hslValues.hue;
    double saturationValue = hslValues.saturation + (_colourImageFilterIntensity * 0.01);
    double lightnessValue = hslValues.lightness - (_colourImageFilterIntensity * 0.01);
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



}
