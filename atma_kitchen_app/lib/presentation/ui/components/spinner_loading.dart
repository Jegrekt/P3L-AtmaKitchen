import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';

class SpinnerLoading extends StatelessWidget {
  const SpinnerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AtmaColors.primary),
    );
  }
}
