import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/imageFilterColourIntensitySlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Returns simple container to display what color the theme is currently using.
class ImageFilterColourIntensitySettings extends StatefulWidget {
  const ImageFilterColourIntensitySettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _ImageFilterColourIntensitySettings createState() =>
      _ImageFilterColourIntensitySettings();
}

class _ImageFilterColourIntensitySettings extends State<ImageFilterColourIntensitySettings> {
  var _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getColourFilterImageIntensity;
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
                  "Image Colour Filter Intensity",
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 4,
                ),
                AdaptiveText(
                  "Use the slider to adjust the intensity of your image colour filter.",
                  style: TextStyle(fontSize: 12, height: 1.1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                width: 450,
                child: ImageFilterColourIntensitySlider(
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
