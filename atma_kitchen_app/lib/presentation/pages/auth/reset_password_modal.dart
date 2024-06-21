import 'package:atma_kitchen_app/presentation/ui/components/button_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/components/my_textfield.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../ui/components/button.dart';
import '../../ui/styles/atma_colors.dart';
import 'bloc/reset/reset_bloc.dart';

Function resetPasswordModal(
        BuildContext context, TextEditingController controller) =>
    () {
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
                  const Text('Reset Password', style: subTtitle),
                  const SizedBox(height: 12),
                  const Text(
                    "Masukan email yang terdaftar untuk mendapatkan link reset password",
                    style: regular,
                  ),
                  const SizedBox(height: 24),
                  MyTextField(
                      controller: controller,
                      hintText: "Email",
                      prefixIcon: Iconsax.direct),
                  const SizedBox(height: 24),
                  BlocConsumer<ResetBloc, ResetState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          success: (message) {
                            Navigator.pop(context);
                            SnackbarMaker.showSnackbar(
                                context, message, AtmaColors.primary);
                          },
                          error: (message) => SnackbarMaker.showSnackbar(
                              context, message, AtmaColors.primary));
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => ElevatedButton(
                          style: buttonPrimary,
                          onPressed: () {
                            context
                                .read<ResetBloc>()
                                .add(ResetEvent.resetPassword(controller.text));
                          },
                          child: const Text('Reset Password'),
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
        controller.clear();
      });
    };
