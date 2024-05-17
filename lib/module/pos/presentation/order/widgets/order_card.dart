import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/checkout_pos/checkout_pos_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';

import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/core/extensions/int_ext.dart';

class OrderCard extends StatelessWidget {
  final ProductQuantity data;
  final VoidCallback onDeleteTap;
  final EdgeInsetsGeometry? padding;

  const OrderCard({
    super.key,
    required this.data,
    required this.onDeleteTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: padding,
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFFC7D0EB)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: Image.network(
                  data.product.image!.contains('http')
                      ? data.product.image!
                      : '${GlobalVariable.baseUrlImage}${data.product.image}',
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceWidth(24.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.product.name ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          (data.product.price! * data.quantity)
                              .currencyFormatRp,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(20.0),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CheckoutPosBloc>()
                                .add(CheckoutPosEvent.removeItem(data.product));
                          },
                          child: Container(
                            color: AppColors.white,
                            child: const Icon(
                              Icons.remove_circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                          child: Center(
                            child: Text(data.quantity.toString()),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CheckoutPosBloc>()
                                .add(CheckoutPosEvent.addItem(data.product));
                          },
                          child: Container(
                            color: AppColors.white,
                            child: const Icon(
                              Icons.add_circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: onDeleteTap,
            icon: const Icon(
              Icons.highlight_off,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
