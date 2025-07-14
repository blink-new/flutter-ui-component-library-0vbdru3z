import 'package:flutter/material.dart';
import 'components/flutter_text.dart';
import 'components/flutter_button.dart';
import 'components/flutter_text_field.dart';
import 'components/flutter_tabs.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Component Library',
      theme: AppTheme.lightTheme,
      home: const ComponentLibraryDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ComponentLibraryDemo extends StatefulWidget {
  const ComponentLibraryDemo({super.key});

  @override
  State<ComponentLibraryDemo> createState() => _ComponentLibraryDemoState();
}

class _ComponentLibraryDemoState extends State<ComponentLibraryDemo> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFfef6ed),
              Color(0xFFfef6ed),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFf68c3d), Color(0xFFf04943)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Flutter UI Components',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Component Library Showcase',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2a2a2a),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'A collection of custom Flutter widgets with warm orange gradient theme',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Text Components Section
                _buildSection(
                  'Text Components',
                  [
                    const FlutterText(
                      'Heading Text',
                      style: FlutterTextStyle.heading,
                    ),
                    const SizedBox(height: 12),
                    const FlutterText(
                      'Subheading Text',
                      style: FlutterTextStyle.subheading,
                    ),
                    const SizedBox(height: 12),
                    const FlutterText(
                      'Body text with regular styling for content and descriptions.',
                      style: FlutterTextStyle.body,
                    ),
                    const SizedBox(height: 12),
                    const FlutterText(
                      'Caption text for small details',
                      style: FlutterTextStyle.caption,
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Button Components Section
                _buildSection(
                  'Button Components',
                  [
                    Row(
                      children: [
                        Expanded(
                          child: FlutterButton(
                            text: 'Primary Button',
                            style: FlutterButtonStyle.primary,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Primary button pressed!')),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FlutterButton(
                            text: 'Secondary',
                            style: FlutterButtonStyle.secondary,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Secondary button pressed!')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FlutterButton(
                            text: 'Outline Button',
                            style: FlutterButtonStyle.outline,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Outline button pressed!')),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FlutterButton(
                            text: 'Text Button',
                            style: FlutterButtonStyle.text,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Text button pressed!')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Text Field Components Section
                _buildSection(
                  'Text Field Components',
                  [
                    const FlutterTextField(
                      label: 'Email Address',
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    const FlutterTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    const FlutterTextField(
                      label: 'Message',
                      hint: 'Type your message here...',
                      maxLines: 4,
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Tab Components Section
                _buildSection(
                  'Tab Components',
                  [
                    FlutterTabs(
                      tabs: const ['Home', 'Profile', 'Settings', 'About'],
                      selectedIndex: _selectedTabIndex,
                      onTabSelected: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFf68c3d).withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _getTabIcon(_selectedTabIndex),
                            size: 48,
                            color: const Color(0xFFf68c3d),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _getTabContent(_selectedTabIndex),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF2a2a2a),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2a2a2a),
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.person;
      case 2:
        return Icons.settings;
      case 3:
        return Icons.info;
      default:
        return Icons.home;
    }
  }

  String _getTabContent(int index) {
    switch (index) {
      case 0:
        return 'Welcome to the Home tab! This is where your main content would be displayed.';
      case 1:
        return 'Profile tab selected. Here you can manage your user profile and personal information.';
      case 2:
        return 'Settings tab is active. Configure your app preferences and options here.';
      case 3:
        return 'About tab content. Learn more about this Flutter UI component library.';
      default:
        return 'Tab content';
    }
  }
}