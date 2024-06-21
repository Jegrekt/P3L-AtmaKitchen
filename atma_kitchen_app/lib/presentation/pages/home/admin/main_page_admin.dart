import 'package:atma_kitchen_app/presentation/pages/home/admin/home_admin_page.dart';
import 'package:atma_kitchen_app/presentation/ui/components/profile_pegawai_page.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({super.key});

  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeAdminPage(),
    const ProfilePegawaiPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: Icon(Iconsax.home),
            label: 'Home',
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
