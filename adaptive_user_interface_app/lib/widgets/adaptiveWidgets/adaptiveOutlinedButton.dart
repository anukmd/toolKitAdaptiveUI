import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';

class AdaptiveOutlinedButton extends OutlinedButton {
  const AdaptiveOutlinedButton({
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
    Color onSurface,
    Color backgroundColor,
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
    final MaterialStateProperty<Color> foregroundColor =
        (onSurface == null && primary == null)
            ? null
            : _OutlinedButtonDefaultForeground(primary, onSurface);
    final MaterialStateProperty<Color> overlayColor =
        (primary == null) ? null : _OutlinedButtonDefaultOverlay(primary);
    final MaterialStateProperty<MouseCursor> mouseCursor =
        (enabledMouseCursor == null && disabledMouseCursor == null)
            ? null
            : _OutlinedButtonDefaultMouseCursor(
                enabledMouseCursor, disabledMouseCursor);

    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      foregroundColor: foregroundColor,
      backgroundColor: ButtonStyleButton.allOrNull<Color>(backgroundColor),
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      elevation: ButtonStyleButton.allOrNull<double>(elevation),
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

  ButtonStyle defaultStyleOf(BuildContext context) {
    bool _differentiateWithoutColorOverride =
        Provider.of<AdaptiveWidgetsViewModel>(context)
            .getDifferentiateWithoutColor;

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

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
      onSurface: colorScheme.onSurface,
      backgroundColor: Colors.transparent,
      shadowColor: theme.shadowColor,
      elevation: 0,
      textStyle: effectiveTextStyle,
      padding: scaledPadding,
      minimumSize: const Size(64, 36),
      side: BorderSide(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        width: 1,
      ),
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

  /// Returns the [TextButtonThemeData.style] of the closest
  /// [TextButtonTheme] ancestor.
  @override
  ButtonStyle themeStyleOf(BuildContext context) {
    return TextButtonTheme.of(context)?.style;
  }
}

@immutable
class _OutlinedButtonDefaultForeground extends MaterialStateProperty<Color>
    with Diagnosticable {
  _OutlinedButtonDefaultForeground(this.primary, this.onSurface);

  final Color primary;
  final Color onSurface;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
      return onSurface?.withOpacity(0.38);
    return primary;
  }
}

@immutable
class _OutlinedButtonDefaultOverlay extends MaterialStateProperty<Color>
    with Diagnosticable {
  _OutlinedButtonDefaultOverlay(this.primary);

  final Color primary;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered))
      return primary?.withOpacity(0.04);
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed))
      return primary?.withOpacity(0.12);
    return null;
  }
}

@immutable
class _OutlinedButtonDefaultMouseCursor
    extends MaterialStateProperty<MouseCursor> with Diagnosticable {
  _OutlinedButtonDefaultMouseCursor(this.enabledCursor, this.disabledCursor);

  final MouseCursor enabledCursor;
  final MouseCursor disabledCursor;

  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return disabledCursor;
    return enabledCursor;
  }
}
