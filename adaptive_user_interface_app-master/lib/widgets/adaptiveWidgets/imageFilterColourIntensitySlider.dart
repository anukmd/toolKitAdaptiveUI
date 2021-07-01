import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageFilterColourIntensitySlider extends StatelessWidget {
  final double currentSliderValue; // Slider Value
  final Function(double) onChangeSlider; // Callback

  ImageFilterColourIntensitySlider(this.currentSliderValue, this.onChangeSlider);

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: currentSliderValue,
        min: 0,
        max: 10,
        divisions: 10,
        label: currentSliderValue.round().toString(),
        onChanged: (double value) {
          Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
              .updateImageColourFilterIntensityValue(value);
          onChangeSlider(value);
        });
  }
}
