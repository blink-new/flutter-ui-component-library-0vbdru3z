import 'package:flutter/material.dart';
import '../components/foodie_logo.dart';
import '../components/gradient_button.dart';
import '../components/outline_button.dart';
import '../components/custom_text_field.dart';
import '../components/fun_mode_toggle.dart';
import '../theme/app_theme.dart';

class FoodieQueueScreen extends StatefulWidget {
  const FoodieQueueScreen({super.key});

  @override
  State<FoodieQueueScreen> createState() => _FoodieQueueScreenState();
}

class _FoodieQueueScreenState extends State<FoodieQueueScreen> {
  bool isJoinScreen = true;
  bool funModeEnabled = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController digitsController = TextEditingController();
  final TextEditingController secretSauceController = TextEditingController();

  void toggleScreen() {
    setState(() {
      isJoinScreen = !isJoinScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: isJoinScreen ? _buildJoinScreen() : _buildHopInScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJoinScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FoodieLogo(),
        const SizedBox(height: 16),
        Text(
          'Join the foodie family!',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        
        // Button row
        Row(
          children: [
            Expanded(
              child: OutlineButton(
                text: 'Hop In!',
                onPressed: toggleScreen,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GradientButton(
                text: 'Join Party!',
                onPressed: () {},
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Form fields
        CustomTextField(
          controller: nameController,
          hintText: 'What should we call you?',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: emailController,
          hintText: 'Your email (optional)',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: digitsController,
          hintText: 'Your digits please!',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: secretSauceController,
          hintText: 'Secret sauce please!',
        ),
        
        const SizedBox(height: 32),
        
        // Fun Mode Toggle
        FunModeToggle(
          isEnabled: funModeEnabled,
          onToggle: (value) {
            setState(() {
              funModeEnabled = value;
            });
          },
        ),
        
        const SizedBox(height: 32),
        
        // Join button
        SizedBox(
          width: double.infinity,
          child: GradientButton(
            text: 'Join the Feast! 🎉',
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildHopInScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FoodieLogo(),
        const SizedBox(height: 16),
        Text(
          'Ready to skip the line?',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        
        // Button row
        Row(
          children: [
            Expanded(
              child: GradientButton(
                text: 'Hop In!',
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlineButton(
                text: 'Join Party!',
                onPressed: toggleScreen,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Form fields
        CustomTextField(
          controller: digitsController,
          hintText: 'Your digits please!',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: secretSauceController,
          hintText: 'Secret sauce please!',
        ),
        
        const SizedBox(height: 32),
        
        // Let's Eat button
        SizedBox(
          width: double.infinity,
          child: GradientButton(
            text: 'Let\'s Eat! 🍴',
            onPressed: () {},
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Forgot link
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Forgot your secret sauce?',
            style: TextStyle(
              color: AppTheme.primaryOrange,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}