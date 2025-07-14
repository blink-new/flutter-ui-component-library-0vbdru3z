import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum FlutterButtonStyle {
  primary,
  secondary,
  outline,
  text,
  gradient,
}

enum FlutterButtonSize {
  small,
  medium,
  large,
}

class FlutterButton extends StatefulWidget {
  final String text;
  final FlutterButtonStyle style;
  final FlutterButtonSize size;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final bool isDisabled;

  const FlutterButton({
    super.key,
    required this.text,
    this.style = FlutterButtonStyle.primary,
    this.size = FlutterButtonSize.medium,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  State<FlutterButton> createState() => _FlutterButtonState();
}

class _FlutterButtonState extends State<FlutterButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = !widget.isDisabled && !widget.isLoading && widget.onPressed != null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => _animationController.forward() : null,
      onTapUp: isEnabled ? (_) => _animationController.reverse() : null,
      onTapCancel: isEnabled ? () => _animationController.reverse() : null,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: _buildButton(context, isEnabled),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, bool isEnabled) {
    final buttonSize = _getButtonSize();
    
    switch (widget.style) {
      case FlutterButtonStyle.primary:
        return _buildPrimaryButton(context, isEnabled, buttonSize);
      
      case FlutterButtonStyle.secondary:
        return _buildSecondaryButton(context, isEnabled, buttonSize);
      
      case FlutterButtonStyle.outline:
        return _buildOutlineButton(context, isEnabled, buttonSize);
      
      case FlutterButtonStyle.text:
        return _buildTextButton(context, isEnabled, buttonSize);
      
      case FlutterButtonStyle.gradient:
        return _buildGradientButton(context, isEnabled, buttonSize);
    }
  }

  Widget _buildPrimaryButton(BuildContext context, bool isEnabled, Size buttonSize) {
    return Container(
      height: buttonSize.height,
      constraints: BoxConstraints(minWidth: buttonSize.width),
      child: ElevatedButton(
        onPressed: isEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.primaryColor : Colors.grey[300],
          foregroundColor: Colors.white,
          elevation: isEnabled ? 2 : 0,
          shadowColor: AppTheme.primaryColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, bool isEnabled, Size buttonSize) {
    return Container(
      height: buttonSize.height,
      constraints: BoxConstraints(minWidth: buttonSize.width),
      child: ElevatedButton(
        onPressed: isEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.grey[100] : Colors.grey[200],
          foregroundColor: isEnabled ? AppTheme.darkColor : Colors.grey[500],
          elevation: isEnabled ? 1 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildOutlineButton(BuildContext context, bool isEnabled, Size buttonSize) {
    return Container(
      height: buttonSize.height,
      constraints: BoxConstraints(minWidth: buttonSize.width),
      child: OutlinedButton(
        onPressed: isEnabled ? widget.onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: isEnabled ? AppTheme.primaryColor : Colors.grey[500],
          side: BorderSide(
            color: isEnabled ? AppTheme.primaryColor : Colors.grey[300]!,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, bool isEnabled, Size buttonSize) {
    return Container(
      height: buttonSize.height,
      constraints: BoxConstraints(minWidth: buttonSize.width),
      child: TextButton(
        onPressed: isEnabled ? widget.onPressed : null,
        style: TextButton.styleFrom(
          foregroundColor: isEnabled ? AppTheme.primaryColor : Colors.grey[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildGradientButton(BuildContext context, bool isEnabled, Size buttonSize) {
    return Container(
      height: buttonSize.height,
      constraints: BoxConstraints(minWidth: buttonSize.width),
      decoration: BoxDecoration(
        gradient: isEnabled ? AppTheme.primaryGradient : null,
        color: isEnabled ? null : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? widget.onPressed : null,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(),
              vertical: _getVerticalPadding(),
            ),
            child: Center(child: _buildButtonContent(textColor: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent({Color? textColor}) {
    if (widget.isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor ?? _getTextColor(),
          ),
        ),
      );
    }

    final content = <Widget>[];
    
    if (widget.icon != null) {
      content.add(widget.icon!);
      content.add(SizedBox(width: _getIconSpacing()));
    }
    
    content.add(
      Text(
        widget.text,
        style: TextStyle(
          fontSize: _getFontSize(),
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: content,
    );
  }

  Size _getButtonSize() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return const Size(80, 32);
      case FlutterButtonSize.medium:
        return const Size(120, 44);
      case FlutterButtonSize.large:
        return const Size(160, 52);
    }
  }

  double _getHorizontalPadding() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return 12;
      case FlutterButtonSize.medium:
        return 20;
      case FlutterButtonSize.large:
        return 28;
    }
  }

  double _getVerticalPadding() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return 6;
      case FlutterButtonSize.medium:
        return 10;
      case FlutterButtonSize.large:
        return 14;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return 12;
      case FlutterButtonSize.medium:
        return 14;
      case FlutterButtonSize.large:
        return 16;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return 14;
      case FlutterButtonSize.medium:
        return 16;
      case FlutterButtonSize.large:
        return 18;
    }
  }

  double _getIconSpacing() {
    switch (widget.size) {
      case FlutterButtonSize.small:
        return 6;
      case FlutterButtonSize.medium:
        return 8;
      case FlutterButtonSize.large:
        return 10;
    }
  }

  Color _getTextColor() {
    switch (widget.style) {
      case FlutterButtonStyle.primary:
      case FlutterButtonStyle.gradient:
        return Colors.white;
      case FlutterButtonStyle.secondary:
        return AppTheme.darkColor;
      case FlutterButtonStyle.outline:
      case FlutterButtonStyle.text:
        return AppTheme.primaryColor;
    }
  }
}