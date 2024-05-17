import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/extensions/int_ext.dart';
import 'package:flutter_pos_ecommerce/core/extensions/string_ext.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/dialogs/discount_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/router/app_router.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/product_quantity.dart';
import '../bloc/order/order_bloc.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);

    List<BankAccountModel> banksLimit = [banks[0], banks[1]];

    void seeAllTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(16.0),
                ValueListenableBuilder(
                  valueListenable: selectedPayment,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: value == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        // selectedPayment.value = banks[index].code;
                        // if (banksLimit.first != banks[index]) {
                        //   banksLimit[1] = banks[index];
                        // }
                        context.pop();
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(14.0),
                    itemCount: banks.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void buyNowTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pesananmu dalam Proses',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Assets.images.processOrder.image(),
                ),
                const SpaceHeight(50.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.trackingOrder,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        icon: Assets.icons.bag.svg(),
                        label: 'Lacak',
                      ),
                    ),
                    const SpaceWidth(4.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.root,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        label: 'Kembali ke Home',
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Row(
          //   children: [
          //     const Icon(Icons.schedule),
          //     const SpaceWidth(12.0),
          //     const Flexible(
          //       child: Text(
          //         'Selesaikan Pembayaran Dalam',
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ),
          //     const SpaceWidth(12.0),
          //     CountdownTimer(
          //       minute: 120,
          //       onTimerCompletion: () {},
          //     ),
          //   ],
          // ),
          // const SpaceHeight(30.0),
          Row(
            children: [
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: seeAllTap,
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(20.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              final paymentVaName = state.maybeWhen(
                orElse: () => '',
                loaded: (_, discount, ___, ____, _____, __, paymentVaName) =>
                    paymentVaName,
              );
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentMethod(
                  isActive: paymentVaName == banksLimit[index].code,
                  data: banksLimit[index],
                  onTap: () {
                    context.read<CheckoutBloc>().add(
                          CheckoutEvent.addPaymentMethod(
                            banksLimit[index].code,
                          ),
                        );
                  },
                ),
                separatorBuilder: (context, index) => const SpaceHeight(14.0),
                itemCount: banksLimit.length,
              );
            },
          ),

          const SpaceHeight(36.0),
          const Divider(),
          const SpaceHeight(8.0),
          const Text(
            'Ringkasan Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          Row(
            children: [
              const Text(
                'Total Belanja',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final subtotal = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (products, discount, _, __, ___, ____, ______) =>
                        products.fold<int>(
                      0,
                      (previousValue, element) =>
                          previousValue +
                          (element.product.price! * element.quantity),
                    ),
                  );
                  return Text(
                    subtotal.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(5.0),
          Row(
            children: [
              const Text(
                'Biaya Kirim',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final shippingCost = state.maybeWhen(
                    orElse: () => 0,
                    loaded:
                        (_, discount, __, ___, ____, shippingCost, ______) =>
                            shippingCost,
                  );
                  return Text(
                    shippingCost.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(5.0),
          Row(
            children: [
              const Text(
                'Segera Ambil =>',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const DiscountDialog(),
                    );
                  },
                  child: const Text("Klaim Diskon"))
            ],
          ),
          const SpaceHeight(8.0),
          const Divider(),
          const SpaceHeight(24.0),
          Row(
            children: [
              const Text(
                'Total Tagihan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  // final total = state.maybeWhen(
                  //   orElse: () => 0,
                  //   loaded: (products, discount, _, __, ___, shippingCost,
                  //           ______) =>
                  //       products.fold<int>(
                  //         0,
                  //         (previousValue, element) =>
                  //             previousValue +
                  //             (element.product.price! * element.quantity),
                  //       ) +
                  //       shippingCost,
                  // );

                  final price = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (products, discount, _, __, ___, shippingCost,
                            ______) =>
                        products.fold(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.product.price! * element.quantity),
                        ) +
                        shippingCost,
                  );

                  final discount = state.maybeWhen(
                      orElse: () => 0,
                      loaded: (products, discount, _, __, ___, shippingCost,
                          ______) {
                        if (discount == null) {
                          return 0;
                        }
                        return discount.value!
                            .replaceAll('.00', '')
                            .toIntegerFromText;
                      });
                  // final totalDiscount = discount / 100 * price;
                  final total = price - (discount / 100 * price);

                  return Text(
                    total.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),

          const SpaceHeight(20.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              final paymentMethod = state.maybeWhen(
                orElse: () => '',
                loaded: (_, discount, __, paymentMethod, ___, ____, ______) =>
                    paymentMethod,
              );
              final shippingService = state.maybeWhen(
                orElse: () => '',
                loaded: (_, discount, __, ___, shippingService, ____, ______) =>
                    shippingService,
              );

              final shippingCost = state.maybeWhen(
                orElse: () => 0,
                loaded: (_, discount, __, ___, ____, shippingCost, ______) =>
                    shippingCost,
              );

              final paymentVaName = state.maybeWhen(
                orElse: () => '',
                loaded: (_, discount, __, ___, ____, _____, paymentVaName) =>
                    paymentVaName,
              );

              final products = state.maybeWhen(
                orElse: () => [],
                loaded: (products, discount, _, __, ___, ____, ______) =>
                    products,
              );

              final addressId = state.maybeWhen(
                orElse: () => 0,
                loaded: (_, discount, addressId, __, ___, ____, ______) =>
                    addressId,
              );
              final discount = state.maybeWhen(
                orElse: () => 0,
                loaded: (_, discount, addressId, __, ___, ____, ______) =>
                    discount,
              );

              return BlocListener<OrderBloc, OrderState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (orderResponseModel) {
                      context.pushNamed(RouteConstants.paymentWaiting,
                          pathParameters: PathParameters().toMap(),
                          extra: orderResponseModel.order!.id);
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(message),
                        ),
                      );
                    },
                  );
                },
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          disabled: paymentMethod == '',
                          onPressed: () {
                            context.read<OrderBloc>().add(OrderEvent.doOrder(
                                addressId: addressId,
                                discount: int.tryParse(discount.toString()) ?? 0,
                                paymentMethod: paymentMethod,
                                shippingService: shippingService,
                                shippingCost: shippingCost,
                                paymentVaName: paymentVaName,
                                products: products as List<ProductQuantity>));
                          },
                          label: 'Bayar Sekarang',
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
