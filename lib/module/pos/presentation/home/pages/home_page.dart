import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/chat_screen.dart';
import 'package:flutter_pos_ecommerce/core/components/search_input_pos.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/bloc/local_product/local_product_bloc.dart';
import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/components/menu_button.dart';
import '../../../../../core/components/spaces.dart';
import '../widgets/product_card.dart';
import '../widgets/product_empty.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final indexValue = ValueNotifier(0);

  // List<ProductModel> searchResults = [];
  // final List<ProductModel> products = [
  //   ProductModel(
  //     image: Assets.images.f1.path,
  //     name: 'Nutty Latte',
  //     category: ProductCategory.drink,
  //     price: 39000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f2.path,
  //     name: 'Iced Latte',
  //     category: ProductCategory.drink,
  //     price: 24000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f3.path,
  //     name: 'Iced Mocha',
  //     category: ProductCategory.drink,
  //     price: 33000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f4.path,
  //     name: 'Hot Mocha',
  //     category: ProductCategory.drink,
  //     price: 33000,
  //     stock: 10,
  //   ),
  // ];

  @override
  void initState() {
    // searchResults = products;
    context
        .read<LocalProductBloc>()
        .add(const LocalProductEvent.getLocalProduct());
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    indexValue.value = index;
    int categoryId = 0;
    switch (index) {
      case 0:
        categoryId = 0;
        break;
      case 1:
        categoryId = 1;
        break;
      case 2:
        categoryId = 2;
        break;
      case 3:
        categoryId = 3;
        break;
      case 4:
        categoryId = 4;
        break;
      default:
    }
    print('Selected CategoryId: $categoryId');
    context
        .read<LocalProductBloc>()
        .add(LocalProductEvent.getLocalProductByCategoryId(categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SearchInput(
              controller: searchController,
              onChanged: (value) {
                if (value.length > 3) {
                  context
                      .read<LocalProductBloc>()
                      .add(LocalProductEvent.searchProduct(value));
                }
                if (value.isEmpty) {
                  context
                      .read<LocalProductBloc>()
                      .add(const LocalProductEvent.fetchAllFromState());
                }
              },
            ),
            const SpaceHeight(20.0),
            ValueListenableBuilder(
              valueListenable: indexValue,
              builder: (context, value, _) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      // Batasan lebar untuk SingleChildScrollView
                      width: MediaQuery.of(context)
                          .size
                          .width, // Lebar layar penuh
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: MenuButton(
                              iconPath: Assets.icons.allCategories.path,
                              label: 'Semua',
                              isActive: value == 0,
                              onPressed: () => onCategoryTap(0),
                            ),
                          ),
                          const SpaceWidth(10.0),
                          Flexible(
                            fit: FlexFit.loose,
                            child: MenuButton(
                              iconPath: Assets.icons.drink.path,
                              label: 'Benih',
                              isActive: value == 1,
                              onPressed: () => onCategoryTap(1),
                            ),
                          ),
                          const SpaceWidth(10.0),
                          Flexible(
                            fit: FlexFit.loose,
                            child: MenuButton(
                              iconPath: Assets.icons.food.path,
                              label: 'Pupuk',
                              isActive: value == 2,
                              onPressed: () => onCategoryTap(2),
                            ),
                          ),
                          const SpaceWidth(10.0),
                          Flexible(
                            fit: FlexFit.loose,
                            child: MenuButton(
                              iconPath: Assets.icons.snack.path,
                              label: 'Pestisida',
                              isActive: value == 3,
                              onPressed: () => onCategoryTap(3),
                            ),
                          ),
                          const SpaceWidth(10.0),
                          Flexible(
                            fit: FlexFit.loose,
                            child: MenuButton(
                              iconPath: Assets.icons.snack.path,
                              label: 'Alat Pertanian',
                              isActive: value == 4,
                              onPressed: () => onCategoryTap(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SpaceHeight(35.0),
            BlocBuilder<LocalProductBloc, LocalProductState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (message) => Center(
                    child: Text(message),
                  ),
                  loaded: (products) {
                    if (products.isEmpty) return const ProductEmpty();
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.65,
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        data: products[index],
                        onCartButton: () {},
                      ),
                    );
                  },
                );
              },
            ),
            const SpaceHeight(30.0),
          ],
        ),
      ),
    );
  }
}
