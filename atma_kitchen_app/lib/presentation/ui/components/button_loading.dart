import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonPrimary,
      onPressed: () {},
      child: const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
