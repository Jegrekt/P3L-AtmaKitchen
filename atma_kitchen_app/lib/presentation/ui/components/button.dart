import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(327, 50),
  backgroundColor: AtmaColors.primary,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  surfaceTintColor: Colors.white,
);

final ButtonStyle smallButtonPrimary = ElevatedButton.styleFrom(
  backgroundColor: AtmaColors.primary,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  surfaceTintColor: Colors.white,
);
