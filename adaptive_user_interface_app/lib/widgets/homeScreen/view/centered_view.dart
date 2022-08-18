import 'package:flutter/material.dart';
import '../size_helpers.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      width: displayWidth(context) * 100,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: displayWidth(context) * 90),
        child: child,
      ),
    );
  }
}
