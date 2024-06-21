import 'dart:ui';

import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';

class Variables {
  static const String baseUrl = 'http://192.168.0.107:8000/api';
  static const String baseImageUrl = 'http://192.168.0.107:8000/images/';
  static const Map<String, String> role = {
    "kar": "Karyawan",
    "own": "Owner",
    "mo": "Manager",
    "adm": "Admin",
  };

  static const Map<String?, Color> rolesChipColor = {
    "Selesai": AtmaColors.successText,
    "Siap": AtmaColors.successText,
    "Batal": AtmaColors.dangerText,
    "Sedang Diantar": AtmaColors.purpleText,
    "Menunggu Diambil": AtmaColors.purpleText,
  };

  static const Map<String?, Color> rolesChipColorBackground = {
    "Selesai": AtmaColors.success,
    "Siap": AtmaColors.success,
    "Batal": AtmaColors.danger,
    "Sedang Diantar": AtmaColors.purple,
    "Menunggu Diambil": AtmaColors.purple,
  };
}
