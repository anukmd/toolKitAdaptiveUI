import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';

class FontSlider extends StatelessWidget {
  final double currentSliderValue;
  final Function(double) onChangeSlider;

  FontSlider(this.currentSliderValue, this.onChangeSlider);
  @override
  Widget build(BuildContext context) {
    // bool _largeFontSize =
    //   Provider.of<AdaptiveWidgetsViewModel>(context).getlargeFontSize;

    return Slider(
        value: currentSliderValue,
        min: 0,
        max: 6,
        divisions: 6,
        label: currentSliderValue.round().toString(),
        onChanged: (double value) {
          Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
              .updateFontSize(value);
          onChangeSlider(value);
        });
  }
}
