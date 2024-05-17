import 'package:flutter/material.dart';
import 'package:flutter_pos_ecommerce/core/router/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../pos/presentation/home/pages/dashboard_page.dart';
import '../../data/datasources/auth_local_datasource.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    await Future.delayed(const Duration(seconds: 3));
    final authData = await AuthLocalDatasource().getAuthData();
    final role = authData?.user?.roles;
    // print('Role: $role');
    if (role == 'owner' || role == 'kasir') {
      context.goNamed(RouteConstants.dashboardPos);
    } else if (role == 'member') {
      context.goNamed(RouteConstants.root,
          pathParameters: PathParameters().toMap());
    } else if (role == null || role.isEmpty) {
      context.goNamed(
        RouteConstants.login,
      );
    } else {
      context.goNamed(
        RouteConstants.login,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Nusa Dua Agro',
          style: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
