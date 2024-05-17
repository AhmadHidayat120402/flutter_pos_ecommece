import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/firebase_options.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/address_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/category_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/discount_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/order_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/alat_pertanian/alat_pertanian_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/benih/benih_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/detail_product/detail_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/pestisida/pestisida_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/pupuk/pupuk_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/history_order/history_order_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/order/order_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/order_detail/order_detail_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/status_order/status_order_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/orders/bloc/tracking/tracking_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/history/bloc/bloc/history_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/checkout_pos/checkout_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/local_product/local_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/bloc/order_pos/order_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/report/bloc/transaction_report/transaction_report_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/bloc/bloc/add_discount_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/bloc/discount/discount_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/colors.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => AllProductBloc(ProductRemoteDatasource())
            ..add(const AllProductEvent.getAllProducts()),
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
          create: (context) => RegisterBloc(AuthRemoteDatasource()),
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
        BlocProvider(
          create: (context) => CostBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => StatusOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => HistoryOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => TrackingBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DetailProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              LocalProductBloc(ProductLocalDatasource.instance),
        ),
        BlocProvider(
          create: (context) => CheckoutPosBloc(),
        ),
        BlocProvider(
          create: (context) => OrderPosBloc(),
        ),
        BlocProvider(
          create: (context) => SyncOrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryPosBloc(),
        ),
        BlocProvider(
          create: (context) => DiscountBloc(DiscountRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddDiscountBloc(DiscountRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              TransactionReportBloc(ProductLocalDatasource.instance),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
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
