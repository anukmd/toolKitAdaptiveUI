// Returns simple container to display what color the theme is currently using.
import 'package:adaptive_user_interface_app/viewModel/ColoursViewModel.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';

class ColourInversionSettings extends StatefulWidget {
  const ColourInversionSettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _ColourInversionSettingsState createState() =>
      _ColourInversionSettingsState();
}

class _ColourInversionSettingsState extends State<ColourInversionSettings> {
  bool _isInverted;
  @override
  void initState() {
    super.initState();
    _isInverted = Provider.of<CustomColoursViewModel>(context, listen: false)
        .getIsInverted;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AdaptiveText("Invert Colours", textAlign: TextAlign.left),
            ),
            SizedBox(
              height: 4,
            ),
            AdaptiveText(
              "Toggle Colour Inversion. This may be used to help improve contrast.",
              style: TextStyle(fontSize: 12, height: 1.1),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Switch(
            value: _isInverted,
            onChanged: (bool newValue) {
              Provider.of<CustomColoursViewModel>(context, listen: false)
                  .toggleColourInverted();
              setState(() {
                _isInverted = newValue;
              });
            },
          ),
        )
      ],
    );
  }
}
