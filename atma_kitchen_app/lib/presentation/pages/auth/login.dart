import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/firebase_api.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../ui/components/button.dart';
import '../../ui/components/my_textfield.dart';
import '../../ui/styles/typography.dart';
import 'bloc/login/login_bloc.dart';
import 'register.dart';
import 'reset_password_modal.dart';
import 'router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController emailReset = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AtmaColors.lightPink,
        ),
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'images/landing_page/logo.png',
                  width: 200,
                  height: 150,
                ),
                const SizedBox(height: 50),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 24),
                            const Text(
                              'Login',
                              style: title,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: email,
                              hintText: "Email",
                              prefixIcon: Iconsax.direct,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: password,
                              hintText: "Password",
                              obscureText: true,
                              prefixIcon: Iconsax.password_check,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    resetPasswordModal(context, emailReset)();
                                  },
                                  child: const Text('Lupa Password?',
                                      style: textButton),
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                            BlocConsumer<LoginBloc, LoginState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                    orElse: () {},
                                    success: (authResponseModel) {
                                      AuthLocalDatasource()
                                          .saveAuthData(authResponseModel);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Routes.routes[
                                                      authResponseModel
                                                          .data!
                                                          .user!
                                                          .role]!) as Route,
                                          (route) => false);
                                      SnackbarMaker.showSnackbar(context,
                                          "Berhasil Login", AtmaColors.primary);
                                    },
                                    error: (message) {
                                      SnackbarMaker.showSnackbar(
                                          context, message, AtmaColors.red);
                                    });
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                    loading: () => const ButtonLoading(),
                                    orElse: () => ElevatedButton(
                                          style: buttonPrimary,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context.read<LoginBloc>().add(
                                                  LoginEvent.login(
                                                      username: email.text,
                                                      password: password.text));
                                            }
                                          },
                                          child: const Text('Login'),
                                        ));
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Belum punya akun? '),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()));
                                  },
                                  child:
                                      const Text('Register', style: textButton),
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
