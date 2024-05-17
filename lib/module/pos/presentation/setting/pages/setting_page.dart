import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/assets/assets.gen.dart';
import 'package:flutter_pos_ecommerce/core/components/menu_button.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_ecommerce/core/router/app_router.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/report/pages/report_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/pages/discount_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/pages/manage_printer_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/pages/sync_data_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../ecommerce/data/datasources/auth_local_datasource.dart';
import '../../../../ecommerce/data/datasources/product_local_datasource.dart';
import '../../../../ecommerce/presentation/auth/bloc/logout/logout_bloc.dart';
import '../../../../ecommerce/presentation/auth/pages/login_page.dart';
import '../bloc/sync_order/sync_order_bloc.dart';
import 'manage_product_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                MenuButton(
                  iconPath: Assets.images.manageProduct.path,
                  label: 'Kelola Produk',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageProductPage())),
                  isImage: true,
                ),
                const SpaceWidth(15.0),
                MenuButton(
                  iconPath: Assets.images.managePrinter.path,
                  label: 'Kelola Printer',
                  onPressed:
                      () {}, //=> context.push(const ManagePrinterPage()),
                  isImage: true,
                ),
              ],
            ),
            const SpaceHeight(20),
            Row(
              children: [
                MenuButton(
                  iconPath: Assets.images.manageProduct.path,
                  label: 'Kelola Diskon',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiscountPage(),
                      )),
                  isImage: true,
                ),
                const SpaceWidth(15.0),
                MenuButton(
                  iconPath: Assets.images.managePrinter.path,
                  label: 'Sinkronisasi Data',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SyncDataPage()));
                  },
                  isImage: true,
                ),
              ],
            ),
            const SpaceHeight(20),
            Row(
              children: [
                MenuButton(
                  iconPath: Assets.images.managePrinter.path,
                  label: 'Manage Printer',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManagePrinterPage()));
                  },
                  isImage: true,
                ),
                const SpaceWidth(15.0),
                MenuButton(
                  iconPath: Assets.images.managePrinter.path,
                  label: 'Report',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportPage()));
                  },
                  isImage: true,
                ),
              ],
            ),
            const SpaceHeight(60),
            ListTile(
              leading: const Icon(
                Icons.login_outlined,
                color: AppColors.primary,
              ),
              title: const Text(
                'Chat',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
            const Divider(),
            BlocConsumer<LogoutBloc, LogoutState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    loaded: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Logout Success'),
                        backgroundColor: AppColors.primary,
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    error: (message) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    });
              },
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return ListTile(
                    leading: const Icon(
                      Icons.login_outlined,
                      color: AppColors.primary,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onTap: () {
                      context
                          .read<LogoutBloc>()
                          .add(const LogoutEvent.logout());
                    },
                  );
                }, loading: () {
                  return const Center(child: CircularProgressIndicator());
                });
              },
            ),
            const Divider(),
          ],
        ));
  }
}
