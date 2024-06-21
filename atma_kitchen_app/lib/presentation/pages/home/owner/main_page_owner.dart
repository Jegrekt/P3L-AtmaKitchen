import 'package:atma_kitchen_app/presentation/pages/home/laporan/view/laporan_page.dart';
import 'package:atma_kitchen_app/presentation/pages/home/owner/home_owner_page.dart';
import 'package:atma_kitchen_app/presentation/ui/components/profile_pegawai_page.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainPageOwner extends StatefulWidget {
  const MainPageOwner({super.key});

  @override
  State<MainPageOwner> createState() => _MainPageOwnerState();
}

class _MainPageOwnerState extends State<MainPageOwner> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const LaporanPage(),
    const ProfilePegawaiPage(),
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
