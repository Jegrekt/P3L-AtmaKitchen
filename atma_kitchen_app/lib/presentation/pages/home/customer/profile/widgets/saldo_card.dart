import 'package:atma_kitchen_app/presentation/pages/auth/bloc/reset/reset_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/saldo/saldo_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/components/my_textfield.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class SaldoCard extends StatefulWidget {
  final String title;
  final int value;
  final List<Color> color;
  final IconData icon;
  const SaldoCard(
      {super.key,
      required this.title,
      required this.value,
      required this.color,
      required this.icon});

  @override
  State<SaldoCard> createState() => _SaldoCardState();
}

class _SaldoCardState extends State<SaldoCard> {
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: widget.color,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    size: 18,
                    widget.icon,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.title,
                    style: regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.value.currencyFormatRp,
                  style: mediumBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 4,
                                      width: 32,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: AtmaColors.darkGray,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text('Penarikan Saldo', style: subTtitle),
                                const SizedBox(height: 12),
                                const Text(
                                  "Masukan jumlah saldo yang ingin ditarik dan deskripsi penarikan saldo",
                                  style: regular,
                                ),
                                const SizedBox(height: 24),
                                MyTextField(
                                    controller: _amount,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    hintText: "Jumlah Saldo",
                                    prefixIcon: Iconsax.money),
                                const SizedBox(height: 24),
                                MyTextField(
                                    controller: _description,
                                    hintText: "Deskripsi",
                                    prefixIcon: Iconsax.text),
                                const SizedBox(height: 24),
                                BlocConsumer<SaldoBloc, SaldoState>(
                                  listener: (context, state) {
                                    state.maybeWhen(
                                        orElse: () {},
                                        successWithdraw: (message) {
                                          Navigator.pop(context);
                                          SnackbarMaker.showSnackbar(context,
                                              message, AtmaColors.primary);
                                        },
                                        error: (message) =>
                                            Navigator.pop(context));
                                  },
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => ElevatedButton(
                                        style: buttonPrimary,
                                        onPressed: () {
                                          context.read<SaldoBloc>().add(
                                              SaldoEvent.withdrawSaldo(
                                                  int.parse(_amount.text),
                                                  _description.text));
                                        },
                                        child: const Text('Tarik Saldo'),
                                      ),
                                      loading: () => const ButtonLoading(),
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        );
                      },
                    ).whenComplete(() {
                      _amount.clear();
                      _description.clear();
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Tarik Saldo',
                        style: regularBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: Icon(
          size: 60,
          widget.icon,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    ]);
  }
}
