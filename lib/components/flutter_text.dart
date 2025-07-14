import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum FlutterTextStyle {
  heading,
  subheading,
  body,
  caption,
  button,
}

class FlutterText extends StatelessWidget {
  final String text;
  final FlutterTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const FlutterText(
    this.text, {
    super.key,
    this.style = FlutterTextStyle.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = color ?? AppTheme.darkColor;

    switch (style) {
      case FlutterTextStyle.heading:
        return TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: baseColor,
          height: 1.2,
        );
      
      case FlutterTextStyle.subheading:
        return TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: baseColor,
          height: 1.3,
        );
      
      case FlutterTextStyle.body:
        return TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: baseColor,
          height: 1.5,
        );
      
      case FlutterTextStyle.caption:
        return TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: baseColor.withOpacity(0.7),
          height: 1.4,
        );
      
      case FlutterTextStyle.button:
        return TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: baseColor,
          height: 1.2,
        );
    }
  }
}

// Custom Text Widget with Gradient Support
class FlutterGradientText extends StatelessWidget {
  final String text;
  final FlutterTextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const FlutterGradientText(
    this.text, {
    super.key,
    this.style = FlutterTextStyle.body,
    this.gradient = AppTheme.primaryGradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: FlutterText(
        text,
        style: style,
        color: Colors.white,
        textAlign: textAlign,
      ),
    );
  }
}