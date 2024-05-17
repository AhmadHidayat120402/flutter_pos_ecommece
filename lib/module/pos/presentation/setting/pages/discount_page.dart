import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/widgets/settings_title.dart';
import '../../../../../core/components/spaces.dart';
import '../bloc/discount/discount_bloc.dart';
import '../dialogs/form_discount_dialog.dart';
import '../models/discount_model.dart';
import '../widgets/add_data.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/manage_discount_card.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  // final List<DiscountModel> discounts = [
  //   DiscountModel(
  //     name: '20',
  //     code: 'BUKAPUASA',
  //     description: null,
  //     discount: 50,
  //     category: ProductCategory.food,
  //   ),
  // ];

  void onEditTap(DiscountModel item) {
    showDialog(
      context: context,
      builder: (context) => FormDiscountDialog(data: item),
    );
  }

  void onAddDataTap() {
    showDialog(
      context: context,
      builder: (context) => const FormDiscountDialog(),
    );
  }

  @override
  void initState() {
    context.read<DiscountBloc>().add(const DiscountEvent.getDiscounts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kelola Diskon'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            BlocBuilder<DiscountBloc, DiscountState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loaded: (discounts) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: discounts.length + 1,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.85,
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddData(
                          title: 'Tambah Diskon Baru',
                          onPressed: onAddDataTap,
                        );
                      }
                      final item = discounts[index - 1];
                      return ManageDiscountCard(
                        data: item,
                        onEditTap: () {},
                      );
                    },
                  );
                });
              },
            ),
          ],
        ));
  }
}
