import 'package:atma_kitchen_app/data/datasources/mo_remote_datasource.dart';
import 'package:atma_kitchen_app/presentation/pages/home/manager/bloc/ketidakhadiran/ketidakhadiran_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/manager/bloc/pegawai/pegawai_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'add_presensi_page.dart';
import 'presensi_card.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    context.read<KetidakhadiranBloc>().add(
        KetidakhadiranEvent.getKetidakhadiran(
            selectedDate.month, selectedDate.year));
    super.initState();
  }

  void onChangeDate() {
    showMonthPicker(
      context: context,
      initialDate: selectedDate,
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
          selectedDate = date;
        });
        context.read<KetidakhadiranBloc>().add(
            KetidakhadiranEvent.getKetidakhadiran(
                selectedDate.month, selectedDate.year));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Presensi")),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AtmaColors.primary,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) =>
                              PegawaiBloc(MoRemoteDatasource()),
                          child: const AddPresensiPage(),
                        )));
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                InkWell(
                  onTap: onChangeDate,
                  child: Chip(
                    label:
                        Text(DateFormat("MMMM", "id_ID").format(selectedDate)),
                    backgroundColor: Colors.white,
                    avatar: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: onChangeDate,
                  child: Chip(
                    label: Text(selectedDate.year.toString()),
                    backgroundColor: Colors.white,
                    avatar: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: BlocConsumer<KetidakhadiranBloc, KetidakhadiranState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ));
                    },
                    addError: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ));
                      context.read<KetidakhadiranBloc>().add(
                          KetidakhadiranEvent.getKetidakhadiran(
                              selectedDate.month, selectedDate.year));
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      loading: () => const Center(child: SpinnerLoading()),
                      success: (ketidakhadiran) {
                        var data = ketidakhadiran.data?.data;
                        if (data!.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: Text(
                              "Data ketidakhadiran tidak ada pada bulan dan tahun ini",
                              textAlign: TextAlign.center,
                            )),
                          );
                        }
                        return ListView.builder(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 68),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return PresensiCard(
                                  pegawai: data[index].pegawai!,
                                  tanggal: data[index].tanggal!);
                            });
                      },
                      orElse: () => const SizedBox());
                },
              ),
            )
          ],
        )));
  }
}
