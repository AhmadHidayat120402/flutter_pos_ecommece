import 'package:flutter/material.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/history/pages/history_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/pages/home_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/pages/order_page.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/constants/colors.dart';
import '../../setting/pages/setting_page.dart';
import '../widgets/nav_item.dart';

class DashboardPosPage extends StatefulWidget {
  const DashboardPosPage({super.key});

  @override
  State<DashboardPosPage> createState() => _DashboardPosPageState();
}

class _DashboardPosPageState extends State<DashboardPosPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const OrdersPage(),
    const HistoryPage(),
    const SettingPage()
    // const ManageMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              iconPath: Assets.icons.home.path,
              label: 'Home',
              isActive: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavItem(
                iconPath: Assets.icons.orders.path,
                label: 'Orders',
                isActive: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  // context.push(const OrdersPage());
                }),
            NavItem(
              iconPath: Assets.icons.payments.path,
              label: 'History',
              isActive: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            NavItem(
              iconPath: Assets.icons.dashboard.path,
              label: 'Kelola',
              isActive: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
