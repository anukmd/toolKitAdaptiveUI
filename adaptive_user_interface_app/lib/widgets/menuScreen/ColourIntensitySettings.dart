import 'package:adaptive_user_interface_app/viewModel/ColoursViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/colourIntensitySlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Returns simple container to display what color the theme is currently using.
class ColourIntensitySettings extends StatefulWidget {
  const ColourIntensitySettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _ColourIntensitySettingsState createState() =>
      _ColourIntensitySettingsState();
}

class _ColourIntensitySettingsState extends State<ColourIntensitySettings> {
  var _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue =
        Provider.of<CustomColoursViewModel>(context, listen: false)
            .getColourIntensity;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdaptiveText(
                  "Colour Intensity",
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 4,
                ),
                AdaptiveText(
                  "Use the slider to adjust the intensity of your colour theme.",
                  style: TextStyle(fontSize: 12, height: 1.1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                width: 450,
                child: ColourIntensitySlider(
                  _currentSliderValue,
                  (double value) => setState(() => _currentSliderValue = value),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
