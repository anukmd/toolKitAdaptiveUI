import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';

class AdaptiveTextButton extends TextButton {
  const AdaptiveTextButton({
    Key key,
    @required this.onPressed,
    this.style,
    this.onLongPress,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    @required this.child,
  })  : assert(clipBehavior != null),
        assert(autofocus != null);
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
            : _TextButtonDefaultForeground(primary, onSurface);
    final MaterialStateProperty<Color> overlayColor =
        (primary == null) ? null : _TextButtonDefaultOverlay(primary);
    final MaterialStateProperty<MouseCursor> mouseCursor =
        (enabledMouseCursor == null && disabledMouseCursor == null)
            ? null
            : _TextButtonDefaultMouseCursor(
                enabledMouseCursor, disabledMouseCursor);

    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      backgroundColor: ButtonStyleButton.allOrNull<Color>(backgroundColor),
      foregroundColor: foregroundColor,
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
    //.copyWith(color: buttonTheme.getTextColor(this));

    // //var effectiveTextStyle;
    if (_differentiateWithoutColorOverride) {
      effectiveTextStyle = effectiveTextStyle
          .merge(const TextStyle(decoration: TextDecoration.underline));
    }

    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.all(8),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.of(context, nullOk: true)?.textScaleFactor ?? 1,
    );

    return styleFrom(
      primary: colorScheme.primary,
      onSurface: colorScheme.onSurface,
      backgroundColor: Colors.transparent,
      shadowColor: theme.shadowColor,
      elevation: 0,
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

  /// Returns the [TextButtonThemeData.style] of the closest
  /// [TextButtonTheme] ancestor.
  @override
  ButtonStyle themeStyleOf(BuildContext context) {
    return TextButtonTheme.of(context)?.style;
  }
}

@immutable
class _TextButtonDefaultForeground extends MaterialStateProperty<Color> {
  _TextButtonDefaultForeground(this.primary, this.onSurface);

  final Color primary;
  final Color onSurface;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled))
      return onSurface?.withOpacity(0.38);
    return primary;
  }

  @override
  String toString() {
    return '{disabled: ${onSurface?.withOpacity(0.38)}, otherwise: $primary}';
  }
}

@immutable
class _TextButtonDefaultOverlay extends MaterialStateProperty<Color> {
  _TextButtonDefaultOverlay(this.primary);

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

  @override
  String toString() {
    return '{hovered: ${primary?.withOpacity(0.04)}, focused,pressed: ${primary?.withOpacity(0.12)}, otherwise: null}';
  }
}

@immutable
class _TextButtonDefaultMouseCursor extends MaterialStateProperty<MouseCursor>
    with Diagnosticable {
  _TextButtonDefaultMouseCursor(this.enabledCursor, this.disabledCursor);

  final MouseCursor enabledCursor;
  final MouseCursor disabledCursor;

  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return disabledCursor;
    return enabledCursor;
  }
}
