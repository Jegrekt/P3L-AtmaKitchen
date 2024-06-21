import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/ketidakhadiran_response_model.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class PresensiCard extends StatelessWidget {
  final Pegawai pegawai;
  final DateTime tanggal;
  const PresensiCard({super.key, required this.pegawai, required this.tanggal});

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
              title: const Text("Tanggal Ketidakhadiran"),
              trailing: Text(DateFormat("d MMMM yyyy", "id_ID").format(tanggal),
                  style: blackRegularBold),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 0.8,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: Text(pegawai.user?.name ?? "-", style: blackRegularBold),
              subtitle: const Text("Nama"),
              trailing: Chip(
                backgroundColor: AtmaColors.success,
                label: Text(Variables.role[pegawai.user!.role]!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AtmaColors.successText)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              leading: const Icon(Iconsax.user),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 0.8,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: Text(pegawai.noTelp ?? "-", style: blackRegularBold),
              subtitle: const Text("No. Telp"),
              leading: const Icon(Iconsax.call),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
            ListTile(
              horizontalTitleGap: 0,
              title:
                  Text(pegawai.user!.username ?? "", style: blackRegularBold),
              subtitle: const Text("Email"),
              leading: const Icon(Iconsax.direct),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 0.8,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: const Text("Alamat"),
              trailing: Text(pegawai.alamat ?? "-", style: blackRegularBold),
              dense: true,
              visualDensity: VisualDensity.comfortable,
            ),
          ])),
    );
  }
}
