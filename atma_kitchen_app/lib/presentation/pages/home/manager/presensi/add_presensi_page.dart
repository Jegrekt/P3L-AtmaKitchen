import 'package:atma_kitchen_app/presentation/pages/home/manager/bloc/ketidakhadiran/ketidakhadiran_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/components/my_textfield.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../bloc/pegawai/pegawai_bloc.dart';

class AddPresensiPage extends StatefulWidget {
  const AddPresensiPage({super.key});

  @override
  State<AddPresensiPage> createState() => _AddPresensiPageState();
}

class _AddPresensiPageState extends State<AddPresensiPage> {
  int selectedPegawai = -1;
  final TextEditingController tglAbsen = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    context.read<PegawaiBloc>().add(const PegawaiEvent.getKaryawan());
    super.initState();
    _focus.addListener(_selectDate);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_selectDate);
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Presensi"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: MyTextField(
                controller: tglAbsen,
                hintText: "Tanggal",
                prefixIcon: Iconsax.calendar,
                readOnly: true,
                focusNode: _focus,
                textInputAction: TextInputAction.none,
                fillColor: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: BlocConsumer<PegawaiBloc, PegawaiState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(message),
                            backgroundColor: Colors.red,
                          ));
                        });
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: SpinnerLoading()),
                      success: (pegawai) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: pegawai.data?.data?.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPegawai =
                                      pegawai.data?.data?[index].id ?? -1;
                                });
                              },
                              child: Column(children: [
                                ListTile(
                                  horizontalTitleGap: 0,
                                  leading: const Icon(Iconsax.user),
                                  title: Text(
                                      pegawai.data?.data?[index].name ?? ""),
                                  subtitle: Text(
                                      pegawai.data?.data?[index].username ??
                                          ""),
                                  trailing: Checkbox(
                                    activeColor: AtmaColors.primary,
                                    value: selectedPegawai ==
                                        pegawai.data?.data?[index].id,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPegawai =
                                            pegawai.data?.data?[index].id ?? -1;
                                      });
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Divider(
                                    thickness: 0.8,
                                  ),
                                ),
                              ]),
                            );
                          },
                        );
                      },
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<KetidakhadiranBloc, KetidakhadiranState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      addSuccess: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          backgroundColor: AtmaColors.primary,
                        ));
                        context.read<KetidakhadiranBloc>().add(
                            KetidakhadiranEvent.getKetidakhadiran(
                                DateTime.now().month, DateTime.now().year));
                        Navigator.pop(context);
                      });
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      loading: () => const ButtonLoading(),
                      orElse: () {
                        return ElevatedButton(
                          onPressed: selectedPegawai == -1 ||
                                  tglAbsen.text.isEmpty
                              ? null
                              : () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Simpan Presensi?'),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  AtmaColors.primary),
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  AtmaColors.primary),
                                          onPressed: () {
                                            context
                                                .read<KetidakhadiranBloc>()
                                                .add(KetidakhadiranEvent
                                                    .addKetidakhadiran(
                                                        selectedPegawai,
                                                        tglAbsen.text));
                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                          style: buttonPrimary,
                          child: selectedPegawai == -1 || tglAbsen.text.isEmpty
                              ? const Text("Pilih Pegawai dan Tanggal")
                              : const Text("Simpan"),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    if (!_focus.hasFocus) return;
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: AtmaColors.primary),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        tglAbsen.text = picked.toString().split(" ")[0];
      });
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
