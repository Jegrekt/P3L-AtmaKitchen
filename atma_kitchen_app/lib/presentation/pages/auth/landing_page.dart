import 'package:atma_kitchen_app/presentation/pages/home/guest/about_us_page.dart';
import 'package:flutter/material.dart';

import '../../ui/components/button.dart';
import '../../ui/styles/atma_colors.dart';
import '../../ui/styles/typography.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AtmaColors.lightPink,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'images/landing_page/logo.png',
              width: 200,
              height: 150,
            ),
            Image.asset(
              'images/landing_page/landing_page.png',
              width: 300,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Start Your Day With',
                    style: title,
                  ),
                  const Text(
                    'Atma Kitchen!',
                    style: TextStyle(
                      color: AtmaColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text('Find and try the best our sweetest cake easily',
                      style: regular),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsPage()),
                      );
                    },
                    child: const Text('Get Started'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
