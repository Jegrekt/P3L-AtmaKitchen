import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:flutter/material.dart';

import '../../auth/login.dart';

class ProfileGuestPage extends StatelessWidget {
  const ProfileGuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                    'Selamat datang di atma kitchen!, silahkan login atau daftar untuk melanjutkan'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                style: buttonPrimary,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
