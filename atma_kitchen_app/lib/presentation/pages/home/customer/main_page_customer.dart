import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/konfirmasipesanan/konfirmasipesanan_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/saldo/saldo_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/produk/produk_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/penjualan/penjualan_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'bloc/profile/profile_bloc.dart';
import 'history/histori_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class MainPageCustomer extends StatefulWidget {
  const MainPageCustomer({super.key});

  @override
  State<MainPageCustomer> createState() => _MainPageCustomerState();
}

class _MainPageCustomerState extends State<MainPageCustomer> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => ProdukBloc(CustomerRemoteDatasource()),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => PenjualanBloc(CustomerRemoteDatasource()),
      child: const HistoriPage(),
    ),
    BlocProvider(
      create: (context) => ProfileBloc(CustomerRemoteDatasource()),
      child: const ProfilePage(),
    ),
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
            icon: Icon(Iconsax.shop),
            label: 'History',
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
