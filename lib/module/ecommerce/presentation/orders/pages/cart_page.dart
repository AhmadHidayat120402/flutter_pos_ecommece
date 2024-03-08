import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/extensions/int_ext.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/router/app_router.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../widgets/cart_tile.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<ProductModel> carts = [
    //   ProductModel(
    //     images: [
    //       Assets.images.products.earphone.path,
    //       Assets.images.products.earphone.path,
    //       Assets.images.products.earphone.path,
    //     ],
    //     name: 'Earphone',
    //     price: 320000,
    //     stock: 20,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    //     store: StoreModel(
    //       name: 'CWB Online Store',
    //       type: StoreEnum.officialStore,
    //       imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    //     ),
    //   ),
    //   ProductModel(
    //     images: [
    //       Assets.images.products.sepatu.path,
    //       Assets.images.products.sepatu2.path,
    //       Assets.images.products.sepatu.path,
    //     ],
    //     name: 'Sepatu Nike',
    //     price: 2200000,
    //     stock: 20,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    //     store: StoreModel(
    //       name: 'CWB Online Store',
    //       type: StoreEnum.officialStore,
    //       imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    //     ),
    //   ),
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
                loaded: (products) {
                  final totalQuantity = products.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity);
                  return totalQuantity > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            totalQuantity.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(
                                RouteConstants.cart,
                                pathParameters: PathParameters().toMap(),
                              );
                            },
                            icon: Assets.icons.cart.svg(height: 24.0),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            context.goNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          icon: Assets.icons.cart.svg(height: 24.0),
                        );
                },
              );
            },
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loaded: (products) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) => CartTile(
                      data: products[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(16.0),
                  );
                },
              );
            },
          ),
          const SpaceHeight(50.0),
          Row(
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final total = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (products) {
                      return products.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.quantity * element.product.price!));
                    },
                  );
                  return Text(
                    total.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(40.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              final totalQty = state.maybeWhen(
                orElse: () => 0,
                loaded: (products) {
                  return products.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity);
                },
              );
              return Button.filled(
                onPressed: () async {
                  final isAuth = await AuthLocalDatasource().isAuth();
                  if (!isAuth) {
                    context.pushNamed(
                      RouteConstants.login,
                    );
                  } else {
                    context.goNamed(RouteConstants.address,
                        pathParameters: PathParameters(
                          rootTab: RootTab.order,
                        ).toMap());
                  }
                },
                label: 'Checkout ($totalQty)',
              );
            },
          ),
        ],
      ),
    );
  }
}
