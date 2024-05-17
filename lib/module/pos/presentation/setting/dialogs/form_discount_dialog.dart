// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos_ecommerce/core/components/custom_text_field.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_category.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/bloc/bloc/add_discount_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/models/discount_model.dart';

import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../bloc/discount/discount_bloc.dart';

class FormDiscountDialog extends StatefulWidget {
  final DiscountModel? data;
  const FormDiscountDialog({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<FormDiscountDialog> createState() => _FormDiscountDialogState();
}

class _FormDiscountDialogState extends State<FormDiscountDialog> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final discountController = TextEditingController();
    // final categoryController =
    //     ValueNotifier<ProductCategory>(data?.category ?? ProductCategory.food);
  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
          ),
          Text(widget.data == null ? 'Tambah Diskon' : 'Edit Diskon'),
          const Spacer(),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.deviceWidth / 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: nameController,
                label: 'Nama Diskon',
                onChanged: (value) {},
              ),
              const SpaceHeight(24.0),
              CustomTextField(
                controller: descriptionController,
                label: 'Deskripsi (Opsional)',
                onChanged: (value) {},
              ),
              const SpaceHeight(24.0),
              CustomTextField(
                controller: discountController,
                label: 'Percent',
                prefixIcon: const Icon(Icons.percent),
                onChanged: (value) {},
                keyboardType: TextInputType.number,
              ),
              const SpaceHeight(24.0),
              BlocConsumer<AddDiscountBloc, AddDiscountState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: () {
                      context
                          .read<DiscountBloc>()
                          .add(const DiscountEvent.getDiscounts());
                      context.pop();
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return Button.filled(
                      onPressed: () {
                        context.read<AddDiscountBloc>().add(
                              AddDiscountEvent.addDiscount(
                                name: nameController.text,
                                description: descriptionController.text,
                                value: int.parse(discountController.text),
                              ),
                            );
                      },
                      label: 'Simpan Diskon',
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
