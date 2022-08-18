import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorSettings extends StatefulWidget {
  const ColorSettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _ColorSettingsState createState() => _ColorSettingsState();
}

class _ColorSettingsState extends State<ColorSettings> {
  bool _differentiateWithoutColor;

  @override
  void initState() {
    super.initState();
    _differentiateWithoutColor =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getDifferentiateWithoutColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdaptiveText(
                "Differentiate without Colour",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 4,
              ),
              AdaptiveText(
                "All buttons and links will become underlined.",
                style: TextStyle(fontSize: 12, height: 1.1),
              ),
            ],
          ),
          Container(
              width: 65,
              child: Switch(
                value: _differentiateWithoutColor,
                onChanged: (bool newValue) {
                  Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
                      .toggleDifferentiateWithoutColor();

                  setState(() {
                    _differentiateWithoutColor = newValue;
                  });
                },
              ))
        ],
      ),
    ]);
  }
}
