import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/fontSizeSlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FontSettings extends StatefulWidget {
  const FontSettings({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _FontSettingsState createState() => _FontSettingsState();
}

class _FontSettingsState extends State<FontSettings> {
  double _currentSliderValue;
  bool _boldTextOverride;
  bool _dyslexicFontOverride;

  @override
  void initState() {
    super.initState();
    _currentSliderValue =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getFontSize;
    _boldTextOverride =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getBoldTextOverride;
    _dyslexicFontOverride =
        Provider.of<AdaptiveWidgetsViewModel>(context, listen: false)
            .getDyslexicFontOverride;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AdaptiveText(
        "Font",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 18),
      ),
      Table(
        // columnWidths: {
        //   0: FlexColumnWidth(MediaQuery.of(context).size.width / 3 * 2),
        //   1: FlexColumnWidth(50),
        // },
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdaptiveText("Bold Font", textAlign: TextAlign.left),
                        SizedBox(
                          height: 4,
                        ),
                        AdaptiveText(
                          "All font will become bold.",
                          style: TextStyle(fontSize: 12, height: 1.1),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Switch(
                            value: _boldTextOverride,
                            onChanged: (bool newValue) {
                              Provider.of<AdaptiveWidgetsViewModel>(context,
                                      listen: false)
                                  .toggleBoldTextOverride();

                              setState(() {
                                _boldTextOverride = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdaptiveText("Dyslexia Friendly Font",
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 4,
                        ),
                        AdaptiveText(
                          "Apply the typeface OpenDyslexic.",
                          style: TextStyle(fontSize: 12, height: 1.1),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Switch(
                            value: _dyslexicFontOverride,
                            onChanged: (bool newValue) {
                              Provider.of<AdaptiveWidgetsViewModel>(context,
                                      listen: false)
                                  .toggleDyslexicFontOverride();

                              setState(() {
                                _dyslexicFontOverride = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdaptiveText("Font Size", textAlign: TextAlign.left),
                        SizedBox(
                          height: 4,
                        ),
                        AdaptiveText(
                          "Adjust display Font Size.",
                          style: TextStyle(fontSize: 12, height: 1.1),
                        ),
                      ],
                    ),
                    Container(
                        width: 450,
                        child: FontSlider(
                          _currentSliderValue,
                          (double value) =>
                              setState(() => _currentSliderValue = value),
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ]);
  }
}
