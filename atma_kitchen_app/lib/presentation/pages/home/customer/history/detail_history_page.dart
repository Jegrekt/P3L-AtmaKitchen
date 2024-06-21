import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/history_penjualan_model.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/konfirmasipesanan/konfirmasipesanan_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'produk_card.dart';

class DetailHistoryPage extends StatelessWidget {
  final Datum historyPenjualan;
  final bool isConfirmed;
  const DetailHistoryPage(
      {super.key, required this.historyPenjualan, this.isConfirmed = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: const Text("Pesanan", style: mediumBold),
                    trailing: Chip(
                      backgroundColor: Variables.rolesChipColorBackground[
                              historyPenjualan.statusPesanan] ??
                          AtmaColors.warning,
                      label: Text(historyPenjualan.statusPesanan.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Variables.rolesChipColor[
                                      historyPenjualan.statusPesanan] ??
                                  AtmaColors.warningText)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    dense: true,
                    visualDensity: VisualDensity.comfortable,
                  ),
                  ListTile(
                    title: const Text("No Nota", style: regular),
                    trailing: Text(
                      historyPenjualan.noNota.toString(),
                      style: blackRegularBold,
                    ),
                    dense: true,
                    visualDensity: VisualDensity.comfortable,
                  ),
                  ListTile(
                      title: const Text("Tanggal Pesan", style: regular),
                      trailing: Text(
                        historyPenjualan.tanggalPesan != null
                            ? DateFormat("d MMMM yyyy", "id_ID")
                                .format(historyPenjualan.tanggalPesan!)
                            : "-",
                        style: blackRegularBold,
                      )),
                  ListTile(
                      title: const Text("Tanggal Siap", style: regular),
                      trailing: Text(
                        historyPenjualan.tanggalSiap != null
                            ? DateFormat("d MMMM yyyy", "id_ID")
                                .format(historyPenjualan.tanggalSiap!)
                            : "-",
                        style: blackRegularBold,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                      title: Text("Detail Pengiriman", style: mediumBold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text("Jenis Pengiriman", style: regular),
                        )),
                        Text(
                            historyPenjualan.jenisPengiriman != null
                                ? historyPenjualan.jenisPengiriman.toString()
                                : "-",
                            style: mediumBold),
                        const SizedBox(width: 10),
                        Container(
                          width: 5,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: AtmaColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      title: const Text("Biaya Pengiriman", style: regular),
                      trailing: Text(
                        historyPenjualan.ongkosKirim != null
                            ? historyPenjualan.ongkosKirim!.currencyFormatRp
                            : "-",
                        style: regular,
                      )),
                  const SizedBox(height: 8),
                  ListTile(
                    title: const Text("Alamat",
                        style: regular, overflow: TextOverflow.ellipsis),
                    trailing: Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              historyPenjualan.alamat?.alamat != null
                                  ? historyPenjualan.alamat!.alamat!
                                  : "-",
                              style: blackRegularBold,
                              overflow: TextOverflow.ellipsis),
                          const Text("Jarak: 0.5 km", style: grayReqular)
                        ],
                      ),
                    ),
                    dense: true,
                    visualDensity: VisualDensity.standard,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            MoreProduct(detailPenjualans: historyPenjualan.detailPenjualans!),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                      title: Text("Detail Pembayaran", style: mediumBold)),
                  ListTile(
                    title: const Text("Jenis Pembayaran", style: regular),
                    trailing: Text(
                      historyPenjualan.metodePembayaran != null
                          ? historyPenjualan.metodePembayaran!
                          : "-",
                      style: blackRegularBold,
                    ),
                    dense: true,
                    visualDensity: VisualDensity.comfortable,
                  ),
                  ListTile(
                      title: const Text("Dibayar Pada", style: regular),
                      trailing: Text(
                        historyPenjualan.tanggalLunas != null
                            ? DateFormat("d MMMM yyyy", "id_ID")
                                .format(historyPenjualan.tanggalLunas!)
                            : "-",
                        style: blackRegularBold,
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  ),
                  ListTile(
                      title: Text(
                          "Harga ${historyPenjualan.detailPenjualans!.length} Barang",
                          style: regular),
                      trailing: Text(
                        historyPenjualan.detailPenjualans!
                            .map((e) => e.subtotal!)
                            .reduce((value, element) => value + element)
                            .currencyFormatRp,
                        style: regular,
                      )),
                  ListTile(
                      title: const Text("Tip", style: regular),
                      trailing: Text(
                        historyPenjualan.tip != null
                            ? historyPenjualan.tip!.currencyFormatRp
                            : "-",
                        style: regular,
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  ),
                  ListTile(
                    title: const Text("Total Belanja", style: mediumBold),
                    trailing: Text(
                      historyPenjualan.grandTotal != null
                          ? historyPenjualan.grandTotal!.currencyFormatRp
                          : "-",
                      style: blackRegularBold,
                    ),
                    dense: true,
                    visualDensity: VisualDensity.comfortable,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4),
                    child: ElevatedButton(
                      onPressed: isConfirmed
                          ? () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Konfirmasi Pesanan?'),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: AtmaColors.primary),
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: AtmaColors.primary),
                                      onPressed: () {
                                        context
                                            .read<KonfirmasipesananBloc>()
                                            .add(KonfirmasipesananEvent
                                                .konfirmasiPesanan(
                                                    historyPenjualan.id!
                                                        .toString()));
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          : null,
                      style: buttonPrimary,
                      child: BlocConsumer<KonfirmasipesananBloc,
                          KonfirmasipesananState>(
                        listener: (context, state) => state.maybeWhen(
                            orElse: () {},
                            error: (message) => SnackbarMaker.showSnackbar(
                                context, message, AtmaColors.dangerText),
                            successKonfirmasi: (message) => {
                                  SnackbarMaker.showSnackbar(
                                      context, message, AtmaColors.primary),
                                  Navigator.pop(context, 'OK')
                                }),
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            ),
                            orElse: () => const Text(
                              "Konfirmasi Pesanan",
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class MoreProduct extends StatefulWidget {
  final List<DetailPenjualan> detailPenjualans;
  const MoreProduct({super.key, required this.detailPenjualans});

  @override
  State<MoreProduct> createState() => _MoreProductState();
}

class _MoreProductState extends State<MoreProduct> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListTile(title: Text("Detail Produk", style: mediumBold)),
          () {
            if (isExpanded) {
              return Column(children: [
                ...widget.detailPenjualans.map((e) => ProdukCard(
                      nama: e.produk!.nama.toString(),
                      qty: e.qty!,
                      harga: e.produk!.harga!,
                      foto: e.produk!.foto,
                      totalHarga: e.subtotal!,
                    ))
              ]);
            }
            return ProdukCard(
              nama: widget.detailPenjualans[0].produk!.nama.toString(),
              qty: widget.detailPenjualans[0].qty!,
              harga: widget.detailPenjualans[0].produk!.harga!,
              foto: widget.detailPenjualans[0].produk!.foto,
              totalHarga: widget.detailPenjualans[0].subtotal!,
            );
          }(),
          () {
            if (widget.detailPenjualans.length > 1) {
              return Column(
                children: [
                  const Divider(
                    thickness: 0.8,
                  ),
                  TextButton(
                    onPressed: () {
                      toggleExpand();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            isExpanded
                                ? "Tampilkan Lihat Sedikit"
                                : "+${widget.detailPenjualans.length - 1} Produk Lainnya",
                            style: textButton),
                        const SizedBox(width: 8),
                        Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AtmaColors.primary)
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          }()
        ],
      ),
    );
  }
}
