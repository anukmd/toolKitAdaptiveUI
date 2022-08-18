import 'package:url_launcher/url_launcher.dart';
import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_user_interface_app/widgets/adaptiveWidgets/adaptiveText.dart';

class AdaptiveLink extends StatelessWidget {
  const AdaptiveLink({
    Key key,
    @required this.child,
    this.url,
  });

  final AdaptiveText child;
  final String url;

  void getStyle() {}
  @override
  Widget build(BuildContext context) {
    bool _differentiateWithoutColorOverride =
        Provider.of<AdaptiveWidgetsViewModel>(context)
            .getDifferentiateWithoutColor;

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle effectiveTextStyle = child.style;

    if (child.style == null || child.style.inherit)
      effectiveTextStyle = defaultTextStyle.style.merge(child.style);

    if (_differentiateWithoutColorOverride) {
      effectiveTextStyle =
          effectiveTextStyle.copyWith(decoration: TextDecoration.underline);
    }

    Widget result = InkWell(
        hoverColor: Colors.grey[300],
        child: AdaptiveText(child.data, style: effectiveTextStyle),
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        });
    return result;
  }
}
