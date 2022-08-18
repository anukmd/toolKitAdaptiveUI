import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import 'ImageFilterColourIntensitySettings.dart';

class ImageFilterSettings extends StatefulWidget {
  const ImageFilterSettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _ImageFilterSettingsState createState() => _ImageFilterSettingsState();
}

class _ImageFilterSettingsState extends State<ImageFilterSettings> {
  bool _imageColorFilter;
  Color _filterColor;

  @override
  void initState() {
    super.initState();
    _imageColorFilter =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getImageColorFilterToggle;
    _filterColor = Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
        .getImageFilterColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveText(
          "Image Settings",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18),
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder(
            bottom: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
            top: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
            right: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
            left: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
            horizontalInside: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
          ),
          children: [
            TableRow(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AdaptiveText(
                                "Image Colour Filter",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              AdaptiveText(
                                "Apply a custom colour filter to all images.",
                                style: TextStyle(fontSize: 12, height: 1.1),
                              ),
                            ],
                          ),
                          Spacer(flex: 4),
                          Expanded(
                            flex: 5,
                            child: Container(
                              width: double.infinity,
                              child: FlatButton(
                                  onPressed: () => _openDialogImageFilterColor(
                                      "Image Filter Color", _filterColor),
                                  color: _filterColor,
                                  child: AdaptiveText("Choose Image Filter Colour",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).primaryTextTheme.button)),
                            ),
                          ),
                          Container(
                            width: 65,
                            child: Switch(
                              value: _imageColorFilter,
                              onChanged: (bool newValue) {
                                setState(() {
                                  _imageColorFilter = newValue;
                                });
                                Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
                                    .toggleImageColorFilter(_filterColor);
                              },
                            )
                          ),
                        ])
                    )
                ]) 
            ]),
            TableRow(
              children: [
                Column(
                  children: [                  
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ImageFilterColourIntensitySettings(context: context),
                    )),
                  ]
                ) 
            ]),
          ])
    ]);
  }

  // Dialog to select colors for theme.
  void _openDialogImageFilterColor(String title, Color currentColor) {
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
                onColorChange: (color) {
                  Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
                      .setImageColourFilter(color);
                  setState(() => _filterColor = color);
                },
                onMainColorChange: (color) {
                  Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
                      .setImageColourFilter(color);
                  setState(() => _filterColor = color);
                },
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
