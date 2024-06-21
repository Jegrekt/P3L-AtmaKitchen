import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/history_penjualan_model.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  final String noNota;
  final DateTime tglTransaksi;
  final String status;
  final DetailPenjualan detailPenjualan;
  final int detailPenjualanLength;
  final int totalPembayaran;
  final Function() onTap;
  const HistoryCard({
    Key? key,
    required this.noNota,
    required this.tglTransaksi,
    required this.status,
    required this.detailPenjualan,
    required this.detailPenjualanLength,
    required this.totalPembayaran,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ListTile(
              horizontalTitleGap: 0,
              title: const Text("Belanja", style: blackRegularBold),
              subtitle: Text(
                  DateFormat("d MMM yyyy", "id_ID").format(tglTransaksi),
                  style: regular),
              trailing: Chip(
                backgroundColor: Variables.rolesChipColorBackground[status] ??
                    AtmaColors.warning,
                label: Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Text(status,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Variables.rolesChipColor[status] ??
                              AtmaColors.warningText)),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              leading: const Icon(Iconsax.shop),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
            ListTile(
              title: const Text(
                "No Nota :",
                style: regular,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(noNota, style: blackRegularBold),
              dense: true,
              visualDensity: VisualDensity.compact,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 0.8,
              ),
            ),
            ListTile(
              horizontalTitleGap: 12,
              title: Text(
                detailPenjualan.produk!.nama.toString(),
                style: blackRegularBold,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("${detailPenjualan.qty!} barang", style: regular),
              leading: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                  child: () {
                    if (detailPenjualan.produk!.foto != null) {
                      return Image.network(
                        Variables.baseImageUrl + detailPenjualan.produk!.foto!,
                        width: 46,
                        height: 46,
                        fit: BoxFit.cover,
                      );
                    }
                    return Image.asset(
                      "images/placeholder.png",
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    );
                  }()),
            ),
            () {
              if (detailPenjualanLength > 1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "+${detailPenjualanLength - 1} produk lainnya",
                    style: grayReqular,
                  ),
                );
              }
              return const SizedBox();
            }(),
            ListTile(
              title: const Text(
                "Total Belanja :",
                style: regular,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(totalPembayaran.currencyFormatRp,
                  style: blackRegularBold),
              trailing: ElevatedButton(
                onPressed: onTap,
                style: smallButtonPrimary,
                child: const Text(
                  "Detail",
                  style: regularBold,
                ),
              ),
            ),
          ])),
    );
  }
}
