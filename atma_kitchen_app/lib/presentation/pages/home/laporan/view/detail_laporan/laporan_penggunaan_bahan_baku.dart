import 'package:atma_kitchen_app/presentation/pages/home/laporan/bloc/laporan_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class LaporanPenggunaanBahanBaku extends StatefulWidget {
  const LaporanPenggunaanBahanBaku({super.key});

  @override
  State<LaporanPenggunaanBahanBaku> createState() =>
      _LaporanPenggunaanBahanBakuState();
}

class _LaporanPenggunaanBahanBakuState
    extends State<LaporanPenggunaanBahanBaku> {
  DateTime tanggalAwal = DateTime.now();
  DateTime tanggalAkhir = DateTime.now();
  @override
  void initState() {
    super.initState();
    context.read<LaporanBloc>().add(LaporanEvent.getPenggunaanBahanBaku(
        tanggalAwal: _formatDate(tanggalAwal),
        tanggalAkhir: _formatDate(tanggalAkhir)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Laporan Penggunaan Bahan Baku'),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<LaporanBloc, LaporanState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const SpinnerLoading(),
                successPenggunaanBahanBaku: (response) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // date picker
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => _showDatePicker(context, true),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text('Dari Tanggal',
                                            style: regularBold),
                                        const SizedBox(height: 8),
                                        Container(
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AtmaColors.darkGray,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Iconsax.calendar,
                                                color: AtmaColors.primary,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                  DateFormat("d MMMM yyyy",
                                                          "id_ID")
                                                      .format(tanggalAwal),
                                                  style: regular),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        _showDatePicker(context, false),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text('Sampai Tanggal',
                                            style: regularBold),
                                        const SizedBox(height: 8),
                                        Container(
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AtmaColors.darkGray,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Iconsax.calendar,
                                                color: AtmaColors.primary,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                  DateFormat("d MMMM yyyy",
                                                          "id_ID")
                                                      .format(tanggalAkhir),
                                                  style: regular),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
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
                              child: Text('LAPORAN PENGGUNAAN BAHAN BAKU',
                                  style: mediumBold.copyWith(
                                      decoration: TextDecoration.underline))),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                  'tanggal Cetak: ${DateFormat("d MMMM yyyy", "id_ID").format(DateTime.now())}',
                                  style: regular)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: DataTable(
                                  border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                          color: AtmaColors.darkGray,
                                          width: 1)),
                                  headingRowColor: MaterialStateProperty.all(
                                      AtmaColors.primary),
                                  columns: const [
                                    DataColumn(
                                        label: Text('Nama Bahan',
                                            style: TextStyle(
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Satuan',
                                            style: TextStyle(
                                                color: Colors.white))),
                                    DataColumn(
                                        label: Text('Digunakan',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ],
                                  rows: [
                                    if (response.data!.isEmpty)
                                      const DataRow(cells: [
                                        DataCell(Text('Data tidak ditemukan')),
                                        DataCell(Text('0')),
                                        DataCell(Text('0')),
                                      ]),
                                    for (var item in response.data!)
                                      DataRow(cells: [
                                        DataCell(Text(item.namaBahan ?? '')),
                                        DataCell(Text(
                                          item.satuan ?? '0',
                                          style: regularBold,
                                        )),
                                        DataCell(
                                            Text(item.digunakan.toString())),
                                      ])
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                error: (message) => Text(message));
          },
        ));
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  void _showDatePicker(BuildContext context, bool isAwal) {
    showDatePicker(
            context: context,
            initialDate: isAwal ? tanggalAwal : tanggalAkhir,
            firstDate: DateTime(2000),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme:
                      const ColorScheme.light(primary: AtmaColors.primary),
                ),
                child: child!,
              );
            },
            lastDate: DateTime(2100))
        .then((value) {
      if (value != null) {
        setState(() {
          if (isAwal) {
            tanggalAwal = value;
          } else {
            tanggalAkhir = value;
          }
        });
        context.read<LaporanBloc>().add(LaporanEvent.getPenggunaanBahanBaku(
            tanggalAwal: _formatDate(tanggalAwal),
            tanggalAkhir: _formatDate(tanggalAkhir)));
      }
    });
  }
}
