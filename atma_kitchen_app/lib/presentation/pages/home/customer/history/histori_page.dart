import 'package:atma_kitchen_app/data/models/response/history_penjualan_model.dart';
import 'package:atma_kitchen_app/data/models/response/konfirmasi_pesanan_response_model.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/konfirmasipesanan/konfirmasipesanan_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/history/history_card.dart';
import 'package:atma_kitchen_app/presentation/ui/components/my_textfield.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../bloc/penjualan/penjualan_bloc.dart';
import 'detail_history_page.dart';

class HistoriPage extends StatefulWidget {
  const HistoriPage({super.key});

  @override
  State<HistoriPage> createState() => _HistoriPageState();
}

class _HistoriPageState extends State<HistoriPage> {
  final TextEditingController search = TextEditingController();
  bool isAll = true;
  List<Datum> historyList = [];
  @override
  void initState() {
    context
        .read<PenjualanBloc>()
        .add(const PenjualanEvent.getHistoryPenjualan(""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("history list length: ${historyList.length}");
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyTextField(
              controller: search,
              hintText: "Cari Transaksi",
              prefixIcon: Iconsax.search_normal,
              fillColor: Colors.white,
              onChanged: (value) {
                context
                    .read<PenjualanBloc>()
                    .add(PenjualanEvent.getHistoryPenjualan(value));
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAll = true;
                  });
                  context
                      .read<PenjualanBloc>()
                      .add(PenjualanEvent.getHistoryPenjualan(search.text));
                },
                child: Chip(
                  label: Text("Semua",
                      style: TextStyle(
                          color: isAll ? Colors.white : AtmaColors.black)),
                  backgroundColor: isAll ? AtmaColors.primary : Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isAll = false;
                    });
                    context.read<KonfirmasipesananBloc>().add(
                        const KonfirmasipesananEvent.getKonfirmasiPesanan(""));
                  },
                  child: Chip(
                    label: Text("Konfirmasi",
                        style: TextStyle(
                            color: isAll ? AtmaColors.black : Colors.white)),
                    backgroundColor: isAll ? Colors.white : AtmaColors.primary,
                  )),
            ]),
          ),
          BlocBuilder<PenjualanBloc, PenjualanState>(
            builder: (context, state) {
              return state.maybeWhen(
                  success: (historyPenjualan) {
                    if (!isAll) {
                      return const SizedBox();
                    }
                    var history = historyPenjualan.data?.data;

                    if ((history == null || history.isEmpty)) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Center(
                          child: Text(
                            "Tidak ada riwayat transaksi",
                          ),
                        ),
                      );
                    }

                    historyList = history;
                    return Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              return HistoryCard(
                                noNota: history[index].noNota!,
                                tglTransaksi: history[index].tanggalPesan!,
                                status: history[index].statusPesanan!,
                                detailPenjualan:
                                    history[index].detailPenjualans![0],
                                detailPenjualanLength:
                                    history[index].detailPenjualans!.length,
                                totalPembayaran: history[index].grandTotal!,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailHistoryPage(
                                        historyPenjualan: history[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }));
                  },
                  error: (message) {
                    SnackbarMaker.showSnackbar(
                        context, message, AtmaColors.red);
                    return const SizedBox();
                  },
                  orElse: () => const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: SpinnerLoading(),
                      ));
            },
          ),
          BlocBuilder<KonfirmasipesananBloc, KonfirmasipesananState>(
            builder: (context, state) {
              return state.maybeWhen(success: (konfirmasiPesanan) {
                if (isAll) {
                  return const SizedBox();
                }
                var historyPesanan = konfirmasiPesanan
                    .map(
                      (e) => historyList.firstWhere(
                          (element) => element.noNota == e.noNota,
                          orElse: () => Datum(
                                id: 0,
                                noNota: "",
                                tanggalPesan: DateTime.now(),
                                statusPesanan: "",
                                grandTotal: 0,
                                detailPenjualans: [],
                              )),
                    )
                    .toList();

                if (historyPesanan.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Center(
                      child: Text(
                        "Tidak ada riwayat transaksi",
                      ),
                    ),
                  );
                }

                return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        itemCount: historyPesanan.length,
                        itemBuilder: (context, index) {
                          if (historyPesanan[index].id == 0) {
                            return const SizedBox();
                          }
                          return HistoryCard(
                            noNota: historyPesanan[index].noNota!,
                            tglTransaksi: historyPesanan[index].tanggalPesan!,
                            status: historyPesanan[index].statusPesanan!,
                            detailPenjualan:
                                historyPesanan[index].detailPenjualans![0],
                            detailPenjualanLength:
                                historyPesanan[index].detailPenjualans!.length,
                            totalPembayaran: historyPesanan[index].grandTotal!,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailHistoryPage(
                                    historyPenjualan: historyPesanan[index],
                                    isConfirmed: true,
                                  ),
                                ),
                              );
                            },
                          );
                        }));
              }, error: (message) {
                SnackbarMaker.showSnackbar(context, message, AtmaColors.red);
                return const SizedBox();
              }, orElse: () {
                if (isAll) return const SizedBox();
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: SpinnerLoading(),
                );
              });
            },
          )
        ])));
  }
}
