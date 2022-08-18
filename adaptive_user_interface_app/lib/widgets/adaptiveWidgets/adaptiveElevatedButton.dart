import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';

class AdaptiveElevatedButton extends OutlinedButton {
  const AdaptiveElevatedButton({
    Key key,
    @required this.onPressed,
    this.style,
    this.onLongPress,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    @required this.child,
  });
  final ButtonStyle style;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final Widget child;
  static ButtonStyle styleFrom({
    Color primary,
    Color onPrimary,
    Color onSurface,
    Color shadowColor,
    double elevation,
    TextStyle textStyle,
    EdgeInsetsGeometry padding,
    Size minimumSize,
    BorderSide side,
    OutlinedBorder shape,
    MouseCursor enabledMouseCursor,
    MouseCursor disabledMouseCursor,
    VisualDensity visualDensity,
    MaterialTapTargetSize tapTargetSize,
    Duration animationDuration,
    bool enableFeedback,
  }) {
    final MaterialStateProperty<Color> backgroundColor =
        (onSurface == null && primary == null)
            ? null
            : _ElevatedButtonDefaultBackground(primary, onSurface);
    final MaterialStateProperty<Color> foregroundColor =
        (onSurface == null && onPrimary == null)
            ? null
            : _ElevatedButtonDefaultForeground(onPrimary, onSurface);
    final MaterialStateProperty<Color> overlayColor =
        (onPrimary == null) ? null : _ElevatedButtonDefaultOverlay(onPrimary);
    final MaterialStateProperty<double> elevationValue =
        (elevation == null) ? null : _ElevatedButtonDefaultElevation(elevation);
    final MaterialStateProperty<MouseCursor> mouseCursor =
        (enabledMouseCursor == null && disabledMouseCursor == null)
            ? null
            : _ElevatedButtonDefaultMouseCursor(
                enabledMouseCursor, disabledMouseCursor);

    return ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      elevation: elevationValue,
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: mouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
    );
  }

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    bool _differentiateWithoutColorOverride =
        Provider.of<AdaptiveWidgetsViewModel>(context)
            .getDifferentiateWithoutColor;

    TextStyle effectiveTextStyle = theme.textTheme.button;

    if (_differentiateWithoutColorOverride) {
      effectiveTextStyle = effectiveTextStyle
          .merge(const TextStyle(decoration: TextDecoration.underline));
    }

    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );

    return styleFrom(
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      onSurface: colorScheme.onSurface,
      shadowColor: theme.shadowColor,
      elevation: 2,
      textStyle: effectiveTextStyle, //theme.textTheme.button,
      padding: scaledPadding,
      minimumSize: const Size(64, 36),
      side: BorderSide.none,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
    );
  }

  /// Returns the [ElevatedButtonThemeData.style] of the closest
  /// [ElevatedButtonTheme] ancestor.
  @override
  ButtonStyle themeStyleOf(BuildContext context) {
    return ElevatedButtonTheme.of(context)?.style;
  }
}

@immutable
class _ElevatedButtonDefaultBackground extends MaterialStateProperty<Color>
    with Diagnosticable {
  _ElevatedButtonDefaultBackground(this.primary, this.onSurface);

  final Color primary;
  final Color onSurface;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
      return onSurface?.withOpacity(0.12);
    return primary;
  }
}

@immutable
class _ElevatedButtonDefaultForeground extends MaterialStateProperty<Color>
    with Diagnosticable {
  _ElevatedButtonDefaultForeground(this.onPrimary, this.onSurface);

  final Color onPrimary;
  final Color onSurface;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
      return onSurface?.withOpacity(0.38);
    return onPrimary;
  }
}

@immutable
class _ElevatedButtonDefaultOverlay extends MaterialStateProperty<Color>
    with Diagnosticable {
  _ElevatedButtonDefaultOverlay(this.onPrimary);

  final Color onPrimary;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered))
      return onPrimary?.withOpacity(0.08);
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed))
      return onPrimary?.withOpacity(0.24);
    return null;
  }
}

@immutable
class _ElevatedButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _ElevatedButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return 0;
    if (states.contains(MaterialState.hovered)) return elevation + 2;
    if (states.contains(MaterialState.focused)) return elevation + 2;
    if (states.contains(MaterialState.pressed)) return elevation + 6;
    return elevation;
  }
}

@immutable
class _ElevatedButtonDefaultMouseCursor
    extends MaterialStateProperty<MouseCursor> with Diagnosticable {
  _ElevatedButtonDefaultMouseCursor(this.enabledCursor, this.disabledCursor);

  final MouseCursor enabledCursor;
  final MouseCursor disabledCursor;

  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return disabledCursor;
    return enabledCursor;
  }
}
