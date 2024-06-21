import 'package:atma_kitchen_app/presentation/pages/home/laporan/bloc/laporan_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LaporanStokBahanBaku extends StatefulWidget {
  const LaporanStokBahanBaku({super.key});

  @override
  State<LaporanStokBahanBaku> createState() => _LaporanStokBahanBakuState();
}

class _LaporanStokBahanBakuState extends State<LaporanStokBahanBaku> {
  @override
  void initState() {
    super.initState();
    context.read<LaporanBloc>().add(const LaporanEvent.getStokBahanBaku());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Laporan Stok Bahan Baku'),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<LaporanBloc, LaporanState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const SpinnerLoading(),
                successStokBahanBaku: (response) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 16),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Atma Kitchen', style: mediumBold)),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Jl. Centralpark No. 10 Yogyakarta',
                                  style: regular)),
                          const SizedBox(height: 16),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('LAPORAN STOK BAHAN BAKU',
                                  style: mediumBold.copyWith(
                                      decoration: TextDecoration.underline))),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                  'tanggal Cetak: ${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.now())}',
                                  style: regular)),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: DataTable(
                                border: TableBorder.symmetric(
                                    outside: const BorderSide(
                                        color: AtmaColors.darkGray, width: 1)),
                                headingRowColor: MaterialStateProperty.all(
                                    AtmaColors.primary),
                                columns: const [
                                  DataColumn(
                                      label: Text('Nama Bahan',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  DataColumn(
                                      label: Text('Satuan',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  DataColumn(
                                      label: Text('Stok',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ],
                                rows: [
                                  for (var item in response.data!)
                                    DataRow(cells: [
                                      DataCell(Text(item.nama ?? '')),
                                      DataCell(Text(item.satuan ?? '0')),
                                      DataCell(Text(item.stok.toString())),
                                    ])
                                ]),
                          ),
                        ],
                      ),
                    ),
                error: (message) => Text(message));
          },
        ));
  }
}
