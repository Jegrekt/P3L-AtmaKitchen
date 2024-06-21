import 'package:atma_kitchen_app/data/models/response/saldo_response_model.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTileSaldo extends StatelessWidget {
  final SaldoModel saldo;
  const ListTileSaldo({super.key, required this.saldo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 0,
          leading: saldo.nominal! > 0
              ? const Icon(
                  Icons.arrow_upward,
                  color: AtmaColors.successText,
                )
              : const Icon(
                  Icons.arrow_downward,
                  color: AtmaColors.dangerText,
                ),
          title: Text(saldo.catatan ?? ''),
          subtitle: Text(DateFormat("d MMMM yyyy HH:mm a", "id_ID")
              .format(saldo.timestamp ?? DateTime.now())),
          trailing: Text(saldo.nominal!.currencyFormatRp,
              style: TextStyle(
                  color: saldo.nominal! > 0
                      ? AtmaColors.successText
                      : AtmaColors.dangerText)),
        ),
        const Divider(
          thickness: 0.8,
        ),
      ],
    );
  }
}
