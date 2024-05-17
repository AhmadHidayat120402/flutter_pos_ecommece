import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/core.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_ecommerce/core/extensions/string_ext.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/checkout_pos/checkout_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/bloc/order_pos/order_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/widgets/payment_success_dialog.dart';

import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/spaces.dart';

class PaymentCashDialog extends StatelessWidget {
  final int price;
  const PaymentCashDialog({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final totalPriceController =
        TextEditingController(text: price.currencyFormatRp);
    return AlertDialog(
      scrollable: true,
      title: Stack(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.highlight_off),
            color: AppColors.primary,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Pembayaran - Tunai',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeight(5.0),
          const SpaceHeight(16.0),
          CustomTextField(
            controller: totalPriceController,
            label: '',
            showLabel: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final int priceValue = value.toIntegerFromText;
              totalPriceController.text = priceValue.currencyFormatRp;
              totalPriceController.selection = TextSelection.fromPosition(
                  TextPosition(offset: totalPriceController.text.length));
            },
          ),
          const SpaceHeight(16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button.filled(
                onPressed: () {},
                label: 'Uang Pas',
                disabled: true,
                textColor: AppColors.primary,
                fontSize: 13.0,
                width: 112.0,
                height: 50.0,
              ),
              const SpaceWidth(4.0),
              Flexible(
                child: Button.filled(
                  onPressed: () {},
                  label: price.currencyFormatRp,
                  disabled: true,
                  textColor: AppColors.primary,
                  fontSize: 13.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
          const SpaceHeight(30.0),
          BlocBuilder<CheckoutPosBloc, CheckoutPosState>(
            builder: (context, state) {
              List<ProductQuantity> items = state.maybeWhen(
                orElse: () => [],
                loaded: (products, discount) => products,
              );

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
              final totalDiscount = discount / 100 * price;
              final totalQty = price - (discount / 100 * price);
              totalPriceController.text = totalQty.currencyFormatRp;

              print("discount di payment $discount");
              print("total di payment $totalQty");

              return Button.filled(
                onPressed: () async {
                  context.read<OrderPosBloc>().add(OrderPosEvent.order(
                        items,
                        discount,
                        0,
                        0,
                        totalPriceController.text.toIntegerFromText,
                      ));

                  showDialog(
                    context: context,
                    builder: (context) => PaymentSuccessDialog(
                      data: items,
                      paymentAmount:
                          totalPriceController.text.toIntegerFromText,
                      totalQty: totalQty.toInt(),
                      totalPrice: price.toInt(),
                      totalDiscount: totalDiscount.toInt(),
                      subTotal: (price - totalDiscount).toInt(),
                      kembalian: totalPriceController.text.toIntegerFromText -
                          (price - totalDiscount).toInt(),
                      normalPrice: price,
                    ),
                  );
                },
                label: 'Bayar',
              );
            },
          ),
        ],
      ),
    );
  }
}
