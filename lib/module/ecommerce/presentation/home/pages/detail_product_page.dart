// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/detail_product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_pos_ecommerce/core/extensions/int_ext.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/detail_product/detail_product_bloc.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/global_variable.dart';
import '../../../../../core/router/app_router.dart';
import '../../../data/models/responses/order_detail_response_model.dart';
import '../../../data/models/responses/product_response_model.dart';
import '../bloc/checkout/checkout_bloc.dart';

class DetailProductPage extends StatefulWidget {
  // final Product product;
  final int productId;
  const DetailProductPage({
    super.key,
    // required this.product,
    required this.productId,
  });

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    context
        .read<DetailProductBloc>()
        .add(DetailProductEvent.detailProduct(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (checkout, _, __, ___, ____, ______,_____) {
                  final totalQuantity = checkout.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue + element.quantity,
                  );
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
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: BlocBuilder<DetailProductBloc, DetailProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (detailProduct) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Image.network(
                      detailProduct.image!.contains('http')
                          ? detailProduct.image!
                          : '${GlobalVariable.baseUrlImage}${detailProduct.image}',
                      width: 170.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceHeight(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detailProduct.name ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Stok : ${detailProduct.stock}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(16.0),
                  Text(
                    detailProduct.price!.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SpaceHeight(16.0),
                  const Text(
                    "Deskripsi Item",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SpaceHeight(16.0),
                  Text(detailProduct.description ?? ''),
                  const SpaceHeight(16.0),
                  Row(
                    children: [
                      Flexible(
                        child: Button.outlined(
                          onPressed: () {
                            context.read<CheckoutBloc>().add(
                                CheckoutEvent.addItem(
                                    detailProduct.toProduct()));
                          },
                          label: '+ Keranjang',
                        ),
                      ),
                      const SpaceWidth(12.0),
                      Flexible(
                        child: Button.filled(
                          onPressed: () {
                            context.read<CheckoutBloc>().add(
                                CheckoutEvent.addItem(
                                    detailProduct.toProduct()));
                            context.pushNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          label: 'Beli Sekarang',
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
