import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/address_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/category_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/alat_pertanian/alat_pertanian_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/benih/benih_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/pestisida/pestisida_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/pupuk/pupuk_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/colors.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => BenihBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PupukBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PestisidaBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AlatPertanianBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CityBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(RajaongkirRemoteDatasource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
