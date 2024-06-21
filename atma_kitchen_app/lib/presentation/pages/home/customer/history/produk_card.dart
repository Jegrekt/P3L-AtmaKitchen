import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';

class ProdukCard extends StatelessWidget {
  final String? foto;
  final String nama;
  final double qty;
  final int harga;
  final int totalHarga;
  const ProdukCard(
      {super.key,
      required this.foto,
      required this.nama,
      required this.qty,
      required this.harga,
      required this.totalHarga});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: AtmaColors.darkGray, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    horizontalTitleGap: 12,
                    title: Text(
                      nama,
                      style: blackRegularBold,
                    ),
                    subtitle: Text("$qty x ${harga.currencyFormatRp}",
                        style: regular),
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: () {
                          if (foto != null) {
                            return Image.network(
                              Variables.baseImageUrl + foto!,
                              width: 46,
                              height: 46,
                              fit: BoxFit.cover,
                            );
                          }
                          return Image.asset(
                            "images/placeholder.png",
                            fit: BoxFit.cover,
                          );
                        }()),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 0.8,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Total Harga :",
                      style: regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(totalHarga.currencyFormatRp,
                        style: blackRegularBold),
                  ),
                ]),
          )),
    );
  }
}
