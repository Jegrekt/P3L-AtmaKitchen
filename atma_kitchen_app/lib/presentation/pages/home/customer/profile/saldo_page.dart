import 'package:atma_kitchen_app/presentation/pages/home/customer/profile/widgets/list_tile_saldo.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../bloc/saldo/saldo_bloc.dart';
import 'widgets/saldo_card.dart';

class SaldoPage extends StatefulWidget {
  final int saldo;
  const SaldoPage({super.key, required this.saldo});

  @override
  State<SaldoPage> createState() => _SaldoPageState();
}

class _SaldoPageState extends State<SaldoPage> {
  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  Future _onRefresh() async {
    context.read<SaldoBloc>().add(const SaldoEvent.getHistorySaldo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Saldo'),
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<SaldoBloc, SaldoState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                error: (message) {
                  SnackbarMaker.showSnackbar(
                      context, message, AtmaColors.dangerText);
                  _onRefresh();
                });
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const SizedBox();
              },
              loading: () {
                return const SpinnerLoading();
              },
              success: (saldoResponseModel) {
                return RefreshIndicator(
                  color: AtmaColors.primary,
                  onRefresh: _onRefresh,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          color: AtmaColors.lightGray,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 16),
                                SaldoCard(
                                  title: 'Saldo',
                                  value: saldoResponseModel.data!.data!.isEmpty
                                      ? widget.saldo
                                      : saldoResponseModel
                                          .data!.data!.last.saldoAkhir!,
                                  color: const [
                                    AtmaColors.primary,
                                    AtmaColors.darkPink
                                  ],
                                  icon: Iconsax.money,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverAppBar(
                        elevation: 1,
                        pinned: true,
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Text("Riwayat Transaksi Saldo",
                              style:
                                  mediumBold.copyWith(color: AtmaColors.black)),
                        ),
                      ),
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        return ListTileSaldo(
                            saldo: saldoResponseModel.data!.data![index]);
                      }, childCount: saldoResponseModel.data!.data!.length)),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
