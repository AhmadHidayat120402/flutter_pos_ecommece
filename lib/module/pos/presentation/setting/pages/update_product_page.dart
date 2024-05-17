// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_pos_ecommerce/core/components/buttons.dart';
import 'package:flutter_pos_ecommerce/core/components/custom_dropdown%20copy.dart';
import 'package:flutter_pos_ecommerce/core/components/image_picker_widget.dart';
import 'package:flutter_pos_ecommerce/core/components/spaces.dart';
import 'package:flutter_pos_ecommerce/core/extensions/string_ext.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/requests/product_request_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/models/category_model.dart';

import '../../../../../core/components/custom_text_field.dart';
import '../../../../ecommerce/presentation/home/bloc/all_product/all_product_bloc.dart';
import '../models/isAvailable_model.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductRequestModel productRequestModel;
  const UpdateProductPage({
    super.key,
    required this.productRequestModel,
  });

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  TextEditingController? nameController;
  TextEditingController? priceController;
  TextEditingController? stockController;
  TextEditingController? isAvailableController;
  TextEditingController? descriptionController;
  TextEditingController? categoryController;

  int category = 1;
  int isAvailable = 1;

  XFile? imageFile;

  final List<CategoryModel> categories = [
    CategoryModel(name: 'Benih', value: 1),
    CategoryModel(name: 'Pupuk', value: 2),
    CategoryModel(name: 'Pestisida', value: 3),
    CategoryModel(name: 'Alat Pertanian', value: 4),
  ];

  final List<IsAvailable> isavailable = [
    IsAvailable(name: 'Ya', value: 1),
    IsAvailable(name: 'Tidak', value: 0),
  ];

  @override
  void initState() {
    final item = widget.productRequestModel;
    nameController = TextEditingController(text: item.name);
    priceController = TextEditingController(text: item.price.toString());
    stockController = TextEditingController(text: item.stock.toString());
    isAvailableController =
        TextEditingController(text: item.is_available.toString());
    descriptionController = TextEditingController(text: item.description);
    categoryController =
        TextEditingController(text: item.category_id.toString());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    priceController!.dispose();
    stockController!.dispose();
    isAvailableController!.dispose();
    descriptionController!.dispose();
    categoryController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: nameController!,
            label: 'Nama Produk',
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: priceController!,
            label: 'Harga Produk',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              // final int priceValue = value.toIntegerFromText;
              // priceController.text = priceValue.currencyFormatRp;
              // priceController.selection = TextSelection.fromPosition(
              //     TextPosition(offset: priceController.text.length));
            },
          ),
          const SpaceHeight(20.0),
          ImagePickerWidget(
            label: 'Foto Produk',
            onChanged: (file) {
              if (file == null) {
                return;
              }
              imageFile = file;
            },
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: stockController!,
            label: 'Stok Produk',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(20.0),
          CustomDropdown<CategoryModel>(
            value: categories.first,
            items: categories,
            label: 'Kategori',
            onChanged: (value) {
              setState(() {
                category = value!.value; // Mengubah nilai category menjadi int
              });
            },
          ),
          const SpaceHeight(20.0),
          CustomDropdown<IsAvailable>(
            value: isavailable.first,
            items: isavailable,
            label: 'Tersedia',
            onChanged: (value) {
              setState(() {
                isAvailable = value!.value;
              });
            },
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: descriptionController!,
            label: 'Deskripsi Produk',
          ),
          const SpaceHeight(24.0),
          BlocConsumer<AllProductBloc, AllProductState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                loaded: (_) {
                  Navigator.pop(context);
                },
                error: (value) => showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(content: Text(value.message)),
                ),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loaded: (_) {
                return Button.filled(
                  onPressed: () {
                    final String name = nameController!.text;
                    final int price = priceController!.text.toIntegerFromText;
                    final int stock = stockController!.text.toIntegerFromText;
                    final Product product = Product(
                        id: widget.productRequestModel.id,
                        name: name,
                        price: price,
                        stock: stock,
                        categoryId: category,
                        description: descriptionController!.text,
                        isAvailable: isAvailable,
                        image: imageFile?.path);
                      
                    print('nama $name');
                    print('price $price');
                    print('stock $stock');
                    print('category $category');
                    print('isAvailable $isAvailable');
                    print('description $descriptionController');
                    print('image $imageFile');
                    context
                        .read<AllProductBloc>()
                        .add(AllProductEvent.updateProduct(product, imageFile));
                  },
                  label: 'Ubah',
                );
              });
            },
          ),
          const SpaceHeight(30.0),
          Button.outlined(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'Batal',
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}
