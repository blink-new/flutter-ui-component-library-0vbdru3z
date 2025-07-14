# Flutter UI Component Library

A comprehensive Flutter Dart component library featuring custom widgets with a warm orange gradient theme and clean sans-serif typography.

## 🎨 Design System

### Color Palette
- **Primary Color**: `#f68c3d` (Orange)
- **Accent Color**: `#f04943` (Red-Orange)
- **Background**: `#fef6ed` (Warm Cream)
- **Card Color**: `#ffffff` (White)
- **Text Color**: `#2a2a2a` (Dark Gray)

### Typography
- **Font Family**: Sans-Serif
- **Text Styles**: Heading, Subheading, Body, Caption, Button

### Gradient
- **Primary Gradient**: Linear gradient from `#f68c3d` to `#f04943`

## 📦 Components

### 1. FlutterText
Custom text widget with predefined styles and gradient support.

```dart
// Basic text styles
FlutterText('Heading Text', style: FlutterTextStyle.heading)
FlutterText('Subheading Text', style: FlutterTextStyle.subheading)
FlutterText('Body text content', style: FlutterTextStyle.body)
FlutterText('Caption text', style: FlutterTextStyle.caption)

// Gradient text
FlutterGradientText('Gradient Text', style: FlutterTextStyle.heading)
```

**Styles Available:**
- `FlutterTextStyle.heading` - 28px, bold
- `FlutterTextStyle.subheading` - 20px, semi-bold
- `FlutterTextStyle.body` - 16px, normal
- `FlutterTextStyle.caption` - 12px, normal
- `FlutterTextStyle.button` - 14px, semi-bold

### 2. FlutterButton
Versatile button component with multiple styles and animations.

```dart
// Button styles
FlutterButton(
  text: 'Primary Button',
  style: FlutterButtonStyle.primary,
  onPressed: () => print('Pressed!'),
)

FlutterButton(
  text: 'Secondary',
  style: FlutterButtonStyle.secondary,
  onPressed: () => print('Pressed!'),
)

FlutterButton(
  text: 'Outline Button',
  style: FlutterButtonStyle.outline,
  onPressed: () => print('Pressed!'),
)

FlutterButton(
  text: 'Gradient Button',
  style: FlutterButtonStyle.gradient,
  onPressed: () => print('Pressed!'),
)
```

**Button Styles:**
- `FlutterButtonStyle.primary` - Solid primary color
- `FlutterButtonStyle.secondary` - Light gray background
- `FlutterButtonStyle.outline` - Outlined with primary color
- `FlutterButtonStyle.text` - Text only
- `FlutterButtonStyle.gradient` - Gradient background

**Button Sizes:**
- `FlutterButtonSize.small` - 32px height
- `FlutterButtonSize.medium` - 44px height (default)
- `FlutterButtonSize.large` - 52px height

**Features:**
- Loading state with spinner
- Disabled state
- Press animation
- Icon support

### 3. FlutterTextField
Advanced text input with focus animations and multiple styles.

```dart
// Basic text field
FlutterTextField(
  label: 'Email Address',
  hint: 'Enter your email',
  keyboardType: TextInputType.emailAddress,
)

// Password field
FlutterTextField(
  label: 'Password',
  hint: 'Enter your password',
  obscureText: true,
)

// Multi-line text area
FlutterTextField(
  label: 'Message',
  hint: 'Type your message here...',
  maxLines: 4,
)
```

**Field Styles:**
- `FlutterTextFieldStyle.outlined` - Outlined border (default)
- `FlutterTextFieldStyle.filled` - Filled background
- `FlutterTextFieldStyle.underlined` - Underlined only

**Features:**
- Focus border color: `#f68c3d`
- Animated focus states
- Error state support
- Helper text
- Prefix/suffix icons
- Input formatters
- Character limits

### 4. FlutterTabs
Flexible tab component with multiple styles and animations.

```dart
// Basic tabs
FlutterTabs(
  tabs: ['Home', 'Profile', 'Settings', 'About'],
  selectedIndex: selectedIndex,
  onTabSelected: (index) => setState(() => selectedIndex = index),
)

// Tab view with content
FlutterTabView(
  tabs: [
    FlutterTab(
      title: 'Home',
      content: HomeContent(),
    ),
    FlutterTab(
      title: 'Profile',
      content: ProfileContent(),
    ),
  ],
)
```

**Tab Styles:**
- `FlutterTabStyle.underlined` - Underlined indicator (default)
- `FlutterTabStyle.filled` - Filled background
- `FlutterTabStyle.outlined` - Outlined container
- `FlutterTabStyle.pills` - Pill-shaped tabs

**Features:**
- Smooth animations
- Scrollable tabs
- Custom colors
- Icon support (in FlutterTab)

## 🚀 Getting Started

### Installation

1. Add the component library to your Flutter project
2. Import the required components:

```dart
import 'package:flutter_ui_component_library/components/flutter_text.dart';
import 'package:flutter_ui_component_library/components/flutter_button.dart';
import 'package:flutter_ui_component_library/components/flutter_text_field.dart';
import 'package:flutter_ui_component_library/components/flutter_tabs.dart';
import 'package:flutter_ui_component_library/theme/app_theme.dart';
```

### Usage Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_ui_component_library/theme/app_theme.dart';
import 'package:flutter_ui_component_library/components/flutter_text.dart';
import 'package:flutter_ui_component_library/components/flutter_button.dart';
import 'package:flutter_ui_component_library/components/flutter_text_field.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FlutterText('Welcome!', style: FlutterTextStyle.heading),
              SizedBox(height: 20),
              FlutterTextField(
                label: 'Email',
                hint: 'Enter your email',
              ),
              SizedBox(height: 20),
              FlutterButton(
                text: 'Get Started',
                style: FlutterButtonStyle.gradient,
                onPressed: () => print('Welcome!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🎯 Features

- **Consistent Design System**: All components follow the same color palette and typography
- **Smooth Animations**: Focus states, button presses, and tab transitions
- **Accessibility**: Proper focus management and semantic labels
- **Customizable**: Easy to modify colors, sizes, and styles
- **Type Safety**: Full Dart type safety with enums and proper typing
- **Performance**: Optimized animations and efficient rendering

## 📱 Demo

Run the demo app to see all components in action:

```bash
flutter run
```

The demo showcases:
- All text styles and variants
- Button types with interactions
- Text field focus states and validation
- Tab navigation with content switching

## 🛠️ Customization

### Theme Customization

Modify `lib/theme/app_theme.dart` to customize colors:

```dart
class AppTheme {
  static const Color primaryColor = Color(0xFFyour_color);
  static const Color accentColor = Color(0xFFyour_accent);
  // ... other colors
}
```

### Component Customization

Each component accepts various parameters for customization:

```dart
FlutterButton(
  text: 'Custom Button',
  style: FlutterButtonStyle.primary,
  size: FlutterButtonSize.large,
  icon: Icon(Icons.star),
  isLoading: false,
  onPressed: () {},
)
```

## 📄 License

This Flutter UI Component Library is open source and available under the MIT License.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For questions or support, please open an issue in the repository.