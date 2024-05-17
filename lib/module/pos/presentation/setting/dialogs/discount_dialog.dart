import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/checkout_pos/checkout_pos_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../setting/bloc/discount/discount_bloc.dart';

class DiscountDialog extends StatelessWidget {
  const DiscountDialog({super.key});

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   context.read<DiscountBloc>().add(const DiscountEvent.getDiscounts());
  // }

  @override
  Widget build(BuildContext context) {
    context.read<DiscountBloc>().add(const DiscountEvent.getDiscounts());
    int discountIdSelected = 0;
    return AlertDialog(
      title: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'DISKON',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.primary,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      content: BlocBuilder<DiscountBloc, DiscountState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (discounts) {
              return StatefulBuilder(
                builder: (context, setState) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: discounts
                      .map(
                        (discount) => ListTile(
                          title: Text('Nama Diskon: ${discount.name}'),
                          subtitle: Text('Potongan harga (${discount.value}%)'),
                          contentPadding: EdgeInsets.zero,
                          textColor: AppColors.primary,
                          trailing: Checkbox(
                            value: discount.id == discountIdSelected,
                            onChanged: (value) {
                              context.read<CheckoutPosBloc>().add(
                                    CheckoutPosEvent.addDiscount(discount),
                                  );
                                  // FIXME
                              setState(() {
                                discountIdSelected = discount.id!;
                              });
                            },
                          ),
                          onTap: () {
                            context.pop();
                          },
                        ),
                      )
                      .toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
