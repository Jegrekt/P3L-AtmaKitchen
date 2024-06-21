import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/produk/produk_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/home/home_page.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'ProfileGuestPage.dart';

class MainPageGuest extends StatefulWidget {
  const MainPageGuest({super.key});

  @override
  State<MainPageGuest> createState() => _MainPageGuestState();
}

class _MainPageGuestState extends State<MainPageGuest> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => ProdukBloc(CustomerRemoteDatasource()),
      child: const HomePage(),
    ),
    const ProfileGuestPage(),
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
