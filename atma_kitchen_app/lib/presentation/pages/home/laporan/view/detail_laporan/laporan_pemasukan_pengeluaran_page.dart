import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../bloc/laporan_bloc.dart';

class LaporanPemasukanPengeluaranPage extends StatefulWidget {
  const LaporanPemasukanPengeluaranPage({super.key});

  @override
  State<LaporanPemasukanPengeluaranPage> createState() =>
      _LaporanPemasukanPengeluaranPageState();
}

class _LaporanPemasukanPengeluaranPageState
    extends State<LaporanPemasukanPengeluaranPage> {
  DateTime tanggal = DateTime.now();
  @override
  void initState() {
    super.initState();
    context.read<LaporanBloc>().add(LaporanEvent.getPemasukanPengeluaran(
        tahun: tanggal.year, bulan: tanggal.month));
  }

  void onChangeDate() {
    showMonthPicker(
      context: context,
      initialDate: tanggal,
      roundedCornersRadius: 10,
      headerColor: AtmaColors.primary,
      selectedMonthBackgroundColor: AtmaColors.primary,
      unselectedMonthTextColor: AtmaColors.primary,
      dismissible: true,
      confirmWidget: const Text(
        "Confirm",
        style: TextStyle(color: AtmaColors.primary),
      ),
      cancelWidget:
          const Text("Cancel", style: TextStyle(color: AtmaColors.primary)),
    ).then((date) {
      if (date != null) {
        debugPrint(date.toString());
        setState(() {
          tanggal = date;
        });
        context.read<LaporanBloc>().add(LaporanEvent.getPemasukanPengeluaran(
            tahun: tanggal.year, bulan: tanggal.month));
      }
    });
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
                successPemasukanPengeluaran: (response) {
                  int totalPemasukan = response.data!
                      .map((e) => e.pemasukan!)
                      .fold(0, (prev, pemasukan) => prev + pemasukan);
                  int totalPengeluaran = response.data!
                      .map((e) => e.pengeluaran!)
                      .fold(0, (prev, pengeluaran) => prev + pengeluaran);
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(children: [
                            InkWell(
                              onTap: onChangeDate,
                              child: Chip(
                                label: Text(DateFormat("MMMM", "id_ID")
                                    .format(tanggal)),
                                backgroundColor: AtmaColors.lightPink,
                                avatar: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: onChangeDate,
                              child: Chip(
                                label: Text(tanggal.year.toString()),
                                backgroundColor: AtmaColors.lightPink,
                                avatar: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          ]),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text('LAPORAN PEMASUKAN DAN PENGELUARAN',
                                style: mediumBold.copyWith(
                                    decoration: TextDecoration.underline))),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                "Bulan : ${DateFormat("MMMM", "id_ID").format(tanggal)}",
                                style: regular)),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                "Tahun : ${DateFormat("yyyy", "id_ID").format(tanggal)}",
                                style: regular)),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                        color: AtmaColors.darkGray, width: 1)),
                                headingRowColor: MaterialStateProperty.all(
                                    AtmaColors.primary),
                                columns: const [
                                  DataColumn(
                                      label: Text('',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  DataColumn(
                                      label: Text('Pemasukan',
                                          style:
                                              TextStyle(color: Colors.white))),
                                  DataColumn(
                                      label: Text('Pengeluaran',
                                          style:
                                              TextStyle(color: Colors.white))),
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
                                      DataCell(Text(item.nama ?? '')),
                                      DataCell(Text(
                                        item.pemasukan!.currencyFormatRp,
                                        style: regular.copyWith(
                                            color: AtmaColors.successText),
                                      )),
                                      DataCell(Text(
                                          item.pengeluaran!.currencyFormatRp,
                                          style: regular.copyWith(
                                              color: AtmaColors.dangerText))),
                                    ]),
                                  DataRow(cells: [
                                    DataCell(const Text('Total',
                                        style: regularBold)),
                                    DataCell(Text(
                                        totalPemasukan.currencyFormatRp,
                                        style: regularBold.copyWith(
                                            color: AtmaColors.successText))),
                                    DataCell(Text(
                                        totalPengeluaran.currencyFormatRp,
                                        style: regularBold.copyWith(
                                            color: AtmaColors.dangerText))),
                                  ]),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (message) => Text(message));
          },
        ));
  }
}
