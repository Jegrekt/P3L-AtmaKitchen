import 'package:atma_kitchen_app/data/datasources/auth_local_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/auth_remote_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/customer_remote_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/firebase_api.dart';
import 'package:atma_kitchen_app/data/datasources/laporan_remote_datasource.dart';
import 'package:atma_kitchen_app/data/datasources/mo_remote_datasource.dart';
import 'package:atma_kitchen_app/firebase_options.dart';
import 'package:atma_kitchen_app/presentation/pages/auth/bloc/logout/logout_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/auth/bloc/reset/reset_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/konfirmasipesanan/konfirmasipesanan_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/bloc/saldo/saldo_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/laporan/bloc/laporan_bloc.dart';
import 'package:atma_kitchen_app/presentation/pages/home/manager/bloc/ketidakhadiran/ketidakhadiran_bloc.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/auth/bloc/login/login_bloc.dart';
import 'presentation/pages/auth/bloc/register/register_bloc.dart';
import 'presentation/pages/auth/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/auth/router.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(AuthRemoteDatasource()),
          ),
          BlocProvider(
              create: (context) => RegisterBloc(AuthRemoteDatasource())),
          BlocProvider(create: (context) => ResetBloc(AuthRemoteDatasource())),
          BlocProvider(create: (context) => LogoutBloc(AuthRemoteDatasource())),
          BlocProvider(
              create: (context) => KetidakhadiranBloc(MoRemoteDatasource())),
          BlocProvider(
            create: (context) => SaldoBloc(CustomerRemoteDatasource()),
          ),
          BlocProvider(
            create: (context) =>
                KonfirmasipesananBloc(CustomerRemoteDatasource()),
          ),
          BlocProvider(
            create: (context) => LaporanBloc(LaporanRemoteDatasource()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: AtmaColors.ligthBlue,
              useMaterial3: false,
              fontFamily: "Poppins",
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: AtmaColors.primary,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: AtmaColors.lightGray,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
                iconTheme: IconThemeData(color: AtmaColors.lightGray),
              )),
          home: FutureBuilder(
              future: AuthLocalDatasource().getRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Routes.routes[snapshot.data]!;
                }
                return const LandingPage();
              }),
        ));
  }
}
