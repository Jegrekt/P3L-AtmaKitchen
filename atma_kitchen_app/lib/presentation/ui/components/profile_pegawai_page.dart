import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/models/response/auth_response_model.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../pages/auth/bloc/logout/logout_bloc.dart';
import '../../pages/auth/login.dart';
import 'snackbar_maker.dart';
import 'spinner_loading.dart';

class ProfilePegawaiPage extends StatefulWidget {
  const ProfilePegawaiPage({super.key});

  @override
  State<ProfilePegawaiPage> createState() => _ProfilePegawaiPageState();
}

class _ProfilePegawaiPageState extends State<ProfilePegawaiPage> {
  AuthResponseModel authResponseModel = AuthResponseModel();

  @override
  void initState() {
    AuthLocalDatasource().getAuthData().then((value) {
      setState(() {
        authResponseModel = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (authResponseModel.data == null) {
      return const Center(
        child: SpinnerLoading(),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profil"),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(authResponseModel.data!.user!.name!,
                                    style: subTtitle,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(authResponseModel.data!.user!.username!,
                                    style: regular),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      size: 20,
                                      Iconsax.star,
                                      color: AtmaColors.lightBlack,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                        Variables.role[authResponseModel
                                            .data!.user!.role!]!,
                                        style: regular),
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Iconsax.user),
                            title: Text('Ubah Profil', style: regular),
                            trailing: Icon(Iconsax.arrow_right_3),
                          ),
                          ListTile(
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
                                      builder: (context) => const Login()));
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
                                        id: authResponseModel.data!.user!.id!))
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ])),
        ));
  }
}
