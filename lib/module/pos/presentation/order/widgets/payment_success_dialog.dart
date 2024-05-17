import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/core.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_ecommerce/core/extensions/date_time_ext.dart';
import 'package:flutter_pos_ecommerce/core/extensions/string_ext.dart';
import 'package:flutter_pos_ecommerce/module/pos/data/dataoutputs/print_dataoutputs.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/checkout_pos/checkout_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/order_item.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/bloc/order_pos/order_pos_bloc.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';

class PaymentSuccessDialog extends StatefulWidget {
  const PaymentSuccessDialog({
    super.key,
    required this.data,
    required this.paymentAmount,
    required this.totalQty,
    required this.totalPrice,
    required this.totalDiscount,
    required this.subTotal,
    required this.kembalian,
    required this.normalPrice,
  });
  final List<ProductQuantity> data;
  final int totalQty;
  final int paymentAmount;
  final int totalPrice;
  final int totalDiscount;
  final int subTotal;
  final int kembalian;
  final int normalPrice;

  @override
  State<PaymentSuccessDialog> createState() => _PaymentSuccessDialogState();
}

class _PaymentSuccessDialogState extends State<PaymentSuccessDialog> {
  // List<OrderItem> data = [];
  // int totalQty = 0;
  // int totalPrice = 0;

  void _handleFinishPressed() {
    context.read<CheckoutPosBloc>().add(const CheckoutPosEvent.started());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardPosPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Assets.icons.done.svg()),
          const SpaceHeight(24.0),
          const Text(
            'Pembayaran telah sukses dilakukan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeight(12.0),
          // const _LabelValue(
          //   label: 'METODE PEMBAYARAN',
          //   value: 'Tunai',
          // ),
          const Text('METODE BAYAR'),
          const SpaceHeight(5.0),
          BlocBuilder<OrderPosBloc, OrderPosState>(
            builder: (context, state) {
              final paymentMethod = state.maybeWhen(
                orElse: () => 'Cash',
                loaded: (model) => model.paymentMethod,
              );
              return Text(
                paymentMethod,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          const Divider(height: 36.0),
          // _LabelValue(
          //   label: 'TOTAL PEMBELIAN',
          //   value: 123000.currencyFormatRp,
          // ),

          const Text('TOTAL TAGIHAN'),
          const SpaceHeight(5.0),
          BlocBuilder<CheckoutPosBloc, CheckoutPosState>(
            builder: (context, state) {
              final price = state.maybeWhen(
                orElse: () => 0,
                loaded: (products, discount) => products.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      (element.product.price! * element.quantity),
                ),
              );

              final discount = state.maybeWhen(
                  orElse: () => 0,
                  loaded: (products, discount) {
                    if (discount == null) {
                      return 0;
                    }
                    return discount.value!
                        .replaceAll('.00', '')
                        .toIntegerFromText;
                  });
              final total = price - (discount / 100 * price);
              return Text(
                total.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          const Divider(height: 36.0),
          // _LabelValue(
          //   label: 'NOMINAL BAYAR',
          //   value: 123000.currencyFormatRp,
          // ),
          const Text('NOMINAL BAYAR'),
          const SpaceHeight(5.0),
          BlocBuilder<OrderPosBloc, OrderPosState>(
            builder: (context, state) {
              final paymentAmount = state.maybeWhen(
                orElse: () => 0,
                loaded: (model) => model.paymentAmount,
              );
              return Text(
                paymentAmount.ceil().currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          const Divider(height: 36.0),
          const Text('KEMBALIAN'),
          const SpaceHeight(5.0),

          BlocBuilder<CheckoutPosBloc, CheckoutPosState>(
            builder: (context, stateCheckout) {
              final price = stateCheckout.maybeWhen(
                orElse: () => 0,
                loaded: (products, discount) => products.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      (element.product.price! * element.quantity),
                ),
              );

              final discount = stateCheckout.maybeWhen(
                  orElse: () => 0,
                  loaded: (products, discount) {
                    if (discount == null) {
                      return 0;
                    }
                    return discount.value!
                        .replaceAll('.00', '')
                        .toIntegerFromText;
                  });
              final total = price - (discount / 100 * price);

              return BlocBuilder<OrderPosBloc, OrderPosState>(
                builder: (context, stateOrderPos) {
                  final paymentAmount = stateOrderPos.maybeWhen(
                    orElse: () => 0,
                    loaded: (model) => model.paymentAmount,
                  );
                  final kembalian = paymentAmount - total;
                  return Text(
                    kembalian.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              );
            },
          ),
          const Divider(height: 36.0),
          _LabelValue(
            label: 'WAKTU PEMBAYARAN',
            value: DateTime.now().toFormattedTime(),
          ),
          const SpaceHeight(40.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: _handleFinishPressed,
                  label: 'Selesai',
                  fontSize: 13,
                ),
              ),
              const SpaceWidth(8.0),
              Flexible(
                child: Button.outlined(
                  onPressed: () async {
                    // final ticket = await CwbPrint.instance.bluetoothStart();
                    // final result =
                    //     await PrintBluetoothThermal.writeBytes(ticket);
                    final printValue = await PrintDataoutputs.instance
                        .printOrder(
                            widget.data,
                            widget.paymentAmount,
                            widget.totalQty,
                            widget.totalPrice,
                            'Cash',
                            widget.totalPrice,
                            'Dayat',
                            widget.totalDiscount,
                            widget.subTotal,
                            widget.kembalian,
                            widget.normalPrice);
                    await PrintBluetoothThermal.writeBytes(printValue);
                  },
                  label: 'Print',
                  icon: Assets.icons.print.svg(),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;

  const _LabelValue({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(),
        ),
        const SpaceHeight(5.0),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
