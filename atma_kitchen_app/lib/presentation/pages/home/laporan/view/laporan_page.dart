import 'package:atma_kitchen_app/presentation/pages/home/laporan/view/detail_laporan/laporan_pemasukan_pengeluaran_page.dart';
import 'package:atma_kitchen_app/presentation/pages/home/laporan/view/detail_laporan/laporan_penggunaan_bahan_baku.dart';
import 'package:atma_kitchen_app/presentation/pages/home/laporan/view/detail_laporan/laporan_stok_bahan_baku_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaporanStokBahanBaku()));
            },
            title: const Text('Stok Bahan Baku'),
            subtitle:
                const Text('Laporan ini berisikan stok bahan baku hari ini'),
            trailing: const Icon(Iconsax.arrow_right_3),
          ),
          const Divider(
            thickness: 0.8,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LaporanPenggunaanBahanBaku()));
            },
            title: const Text('Penggunaan Bahan Baku'),
            subtitle: const Text(
                'Laporan ini berisikan pengunaan bahan baku pada tanggal tertentu'),
            trailing: const Icon(Iconsax.arrow_right_3),
          ),
          const Divider(
            thickness: 0.8,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LaporanPemasukanPengeluaranPage()));
            },
            title: const Text('Pemasukan Pengeluaran'),
            subtitle: const Text(
                'Laporan ini berisikan tentang hasil pejualan dalam Atma Kithcen setiap perbulan'),
            trailing: const Icon(Iconsax.arrow_right_3),
          ),
          const Divider(
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
