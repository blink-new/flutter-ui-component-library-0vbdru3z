# Foodie Queue - Flutter UI Component Library

A comprehensive Flutter Dart component library featuring the "Foodie Queue" app design with custom widgets including text, button, text field, and tab components.

## 🎨 Design System

### Color Palette
- **Primary Orange**: `#f68c3d`
- **Accent Red**: `#f04943`
- **Background**: `#fef6ed`
- **Card Color**: `#ffffff`
- **Text Primary**: `#2D3748`
- **Text Secondary**: `#718096`
- **Text Placeholder**: `#A0AEC0`

### Typography
- **Font Family**: Inter (Sans-Serif)
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)

### Gradient
- **Primary Gradient**: Linear gradient from `#f68c3d` to `#f04943`

## 📱 Screens

### 1. Join Screen
- Welcome message: "Join the foodie family!"
- Two action buttons: "Hop In!" and "Join Party!"
- Form fields:
  - Name input: "What should we call you?"
  - Email input: "Your email (optional)"
  - Phone input: "Your digits please!"
  - Secret input: "Secret sauce please!"
- Fun Mode toggle with party emoji
- Primary action: "Join the Feast! 🎉"

### 2. Hop In Screen
- Welcome message: "Ready to skip the line?"
- Two action buttons: "Hop In!" and "Join Party!"
- Simplified form:
  - Phone input: "Your digits please!"
  - Secret input: "Secret sauce please!"
- Primary action: "Let's Eat! 🍴"
- Forgot link: "Forgot your secret sauce?"

## 🧩 Components

### Core Components

#### 1. FoodieLogo
- Circular gradient icon with restaurant symbol
- Gradient text title "Foodie Queue"
- Centered layout with proper spacing

#### 2. GradientButton
- Primary action button with orange-to-red gradient
- Rounded corners (25px radius)
- White text with medium font weight
- Subtle shadow effect
- Customizable text and onPressed callback

#### 3. OutlineButton
- Secondary action button with light gray background
- Subtle border and rounded corners
- Gray text color
- Hover and press states

#### 4. CustomTextField
- Rounded input fields (25px radius)
- Focus state with orange border (#f68c3d)
- Placeholder text styling
- White background with subtle shadow
- Customizable hint text and controller

#### 5. FunModeToggle
- Custom toggle switch with gradient active state
- Party emoji icon
- Smooth animation transitions
- "Fun Mode" label

### Theme System

#### AppTheme Class
- Centralized color definitions
- Material Design theme configuration
- Custom text styles for different hierarchies
- Input decoration theme with focus states
- Button styling defaults

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # Theme configuration
├── screens/
│   └── foodie_queue_screen.dart  # Main screen with state management
└── components/
    ├── foodie_logo.dart     # Logo component
    ├── gradient_button.dart # Primary button
    ├── outline_button.dart  # Secondary button
    ├── custom_text_field.dart # Input field
    └── fun_mode_toggle.dart # Toggle switch
```

## 🚀 Features

- **Modular Architecture**: Each component is self-contained and reusable
- **Flutter-Inspired Design**: Clean, modern Material Design patterns
- **Interactive Components**: Proper state management and user feedback
- **Focus State Management**: Orange border highlight on text field focus
- **Gradient Theming**: Consistent gradient usage across components
- **Sans-Serif Typography**: Clean Inter font family hierarchy
- **Responsive Layout**: Adapts to different screen sizes
- **Animation Support**: Smooth transitions and micro-interactions

## 📋 Usage

### Basic Implementation

```dart
import 'package:flutter/material.dart';
import 'screens/foodie_queue_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FoodieQueueApp());
}

class FoodieQueueApp extends StatelessWidget {
  const FoodieQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Queue',
      theme: AppTheme.lightTheme,
      home: const FoodieQueueScreen(),
    );
  }
}
```

### Component Usage Examples

```dart
// Gradient Button
GradientButton(
  text: 'Join Party!',
  onPressed: () {
    // Handle button press
  },
)

// Custom Text Field
CustomTextField(
  controller: nameController,
  hintText: 'What should we call you?',
)

// Fun Mode Toggle
FunModeToggle(
  isEnabled: funModeEnabled,
  onToggle: (value) {
    setState(() {
      funModeEnabled = value;
    });
  },
)
```

## 🎯 Key Features

1. **State Management**: Proper StatefulWidget implementation with screen transitions
2. **Form Handling**: TextEditingController integration for all input fields
3. **Custom Styling**: Consistent design system with reusable components
4. **Interactive Elements**: Toggle switches, buttons with proper feedback
5. **Navigation**: Screen switching between Join and Hop In modes
6. **Accessibility**: Proper semantic structure and focus management

## 🔧 Customization

All components are highly customizable through:
- Theme system modifications in `AppTheme`
- Component-level property overrides
- Color palette adjustments
- Typography scaling
- Animation timing adjustments

## 📱 Responsive Design

The layout automatically adapts to different screen sizes with:
- Flexible container constraints
- Proper padding and margins
- Scalable typography
- Touch-friendly button sizes

This component library provides a solid foundation for building modern Flutter applications with a consistent, professional design system.