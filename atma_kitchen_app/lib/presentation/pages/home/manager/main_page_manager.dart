import 'package:atma_kitchen_app/presentation/pages/home/manager/presensi/presensi_page.dart';
import 'package:atma_kitchen_app/presentation/ui/components/profile_pegawai_page.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../laporan/view/laporan_page.dart';

class MainPageManager extends StatefulWidget {
  const MainPageManager({super.key});

  @override
  State<MainPageManager> createState() => _MainPageManagerState();
}

class _MainPageManagerState extends State<MainPageManager> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PresensiPage(),
    const LaporanPage(),
    const ProfilePegawaiPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: AtmaColors.lightPink,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.people),
            label: 'Presensi',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.chart),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}
