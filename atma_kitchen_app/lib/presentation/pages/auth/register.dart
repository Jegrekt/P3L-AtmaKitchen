import 'package:atma_kitchen_app/presentation/ui/components/my_textfield.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../ui/components/button.dart';
import '../../ui/components/button_loading.dart';
import 'bloc/register/register_bloc.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController tglLahir = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  final TextEditingController noTelp = TextEditingController();
  final FocusNode _focus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
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
                              'Register',
                              style: title,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: nama,
                              hintText: "Nama",
                              prefixIcon: Iconsax.user,
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
                              prefixIcon: Iconsax.password_check,
                              obscureText: true,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: alamat,
                              hintText: "Alamat",
                              prefixIcon: Iconsax.home,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: noTelp,
                              hintText: "No Telp",
                              prefixIcon: Iconsax.call,
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              controller: tglLahir,
                              hintText: "Tanggal Lahir",
                              prefixIcon: Iconsax.calendar,
                              readOnly: true,
                              focusNode: _focus,
                              textInputAction: TextInputAction.none,
                            ),
                            const SizedBox(height: 24),
                            BlocConsumer<RegisterBloc, RegisterState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                    orElse: () {},
                                    success: (message) {
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
                                    loading: () => const ButtonLoading(),
                                    orElse: () => ElevatedButton(
                                          style: buttonPrimary,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context.read<RegisterBloc>().add(
                                                  RegisterEvent.register(
                                                      nama: nama.text,
                                                      username: email.text,
                                                      password: password.text,
                                                      alamat: alamat.text,
                                                      tglLahir: tglLahir.text,
                                                      noTelp: noTelp.text));
                                            }
                                          },
                                          child: const Text('Register'),
                                        ));
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sudah punya akun? '),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                  child: const Text('Login', style: textButton),
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

  Future<void> _selectDate() async {
    if (!_focus.hasFocus) return;
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
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
        tglLahir.text = picked.toString().split(" ")[0];
      });
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
