import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/firebase_api.dart';
import 'package:atma_kitchen_app/data/models/response/profile_response_model.dart';
import 'package:atma_kitchen_app/presentation/pages/auth/bloc/logout/logout_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/auth/login.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/profile/profile_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'saldo_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(const ProfileEvent.getProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profil"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const SpinnerLoading(),
                  success: (profileData) {
                    String name = profileData.data!.name.toString();
                    String email = profileData.data!.username.toString();
                    DateTime tglLahir =
                        profileData.data!.customer!.tanggalLahir!;
                    String saldo =
                        profileData.data!.customer!.saldo!.currencyFormatRp;
                    String poin = profileData.data!.customer!.poin.toString();
                    List<Alamat> alamat = profileData.data!.customer!.alamats!;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('images/profile_blank.png'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(name,
                                          style: subTtitle,
                                          overflow: TextOverflow.ellipsis),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(email, style: regular),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            size: 20,
                                            Iconsax.calendar,
                                            color: AtmaColors.lightBlack,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              DateFormat("d MMMM yyyy", "id_ID")
                                                  .format(tglLahir),
                                              style: regular),
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ListTile(
                                      minLeadingWidth: 8,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SaldoPage(
                                                      saldo: profileData.data!
                                                          .customer!.saldo!,
                                                    )));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      leading: const Icon(
                                        Iconsax.money,
                                        color: AtmaColors.darkGreen,
                                      ),
                                      title:
                                          const Text('Saldo', style: regular),
                                      subtitle:
                                          Text(saldo, style: blackRegularBold),
                                      trailing: const Icon(
                                        Iconsax.arrow_right_3,
                                        color: AtmaColors.lightBlack,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Iconsax.coin,
                                            color: AtmaColors.yellow,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Poin',
                                                  style: regular),
                                              Text(poin, style: regularBold)
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                  leading: Icon(Iconsax.user),
                                  title: Text('Ubah Profil', style: regular),
                                  trailing: Icon(Iconsax.arrow_right_3),
                                ),
                                ListTile(
                                  leading: const Icon(Iconsax.home),
                                  title: const Text('Alamat', style: regular),
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 4,
                                                    width: 32,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AtmaColors.darkGray,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                child: Text('Daftar Alamat',
                                                    style: subTtitle),
                                              ),
                                              const SizedBox(height: 8),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: alamat.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      ListTile(
                                                        title: Text(
                                                            alamat[index]
                                                                .alamat
                                                                .toString(),
                                                            style: regular),
                                                        subtitle: Text(
                                                            'Jarak : ${alamat[index].jarak != null ? alamat[index].jarak! : ""} km',
                                                            style: regular),
                                                        trailing: const Icon(
                                                            Iconsax
                                                                .arrow_right_3),
                                                      ),
                                                      const Divider(
                                                        thickness: 0.8,
                                                      )
                                                    ],
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  trailing: const Icon(Iconsax.arrow_right_3),
                                ),
                                const ListTile(
                                  leading: Icon(Iconsax.notification),
                                  title: Text('Notifikasi', style: regular),
                                  trailing: Icon(Iconsax.arrow_right_3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BlocConsumer<LogoutBloc, LogoutState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                  orElse: () {},
                                  success: (message) {
                                    AuthLocalDatasource().removeAuthData();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                    SnackbarMaker.showSnackbar(
                                        context, message, AtmaColors.primary);
                                  },
                                  error: (message) {
                                    SnackbarMaker.showSnackbar(
                                        context, message, AtmaColors.red);
                                  });
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () {
                                  return const SpinnerLoading();
                                },
                                orElse: () => Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ListTile(
                                    leading: const Icon(Iconsax.logout,
                                        color: AtmaColors.red),
                                    title: const Text('Keluar', style: regular),
                                    trailing: const Icon(Iconsax.arrow_right_3),
                                    onTap: () => {
                                      context.read<LogoutBloc>().add(
                                          LogoutEvent.logout(
                                              id: profileData.data!.id!))
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ]);
                  },
                  orElse: () => const SpinnerLoading(),
                );
              },
            ),
          ),
        ));
  }
}
