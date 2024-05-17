import 'package:flutter/material.dart';
import 'package:flutter_pos_ecommerce/core/extensions/build_context_ext%20copy.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/requests/product_request_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/pages/update_product_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/components/buttons.dart';
import '../../../../../core/components/spaces.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/global_variable.dart';

class MenuProductItem extends StatelessWidget {
  final Product data;
  const MenuProductItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: AppColors.blueLight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              data.image!.contains('http')
                  ? data.image!
                  : '${GlobalVariable.baseUrlImage}${data.image}',
              width: 74,
              height: 74,
              fit: BoxFit.cover,
            ),
          ),
          const SpaceWidth(11.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SpaceHeight(5.0),
                Text(
                  data.category?.name ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SpaceHeight(10.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          showDialog(
                              context: context,
                              // backgroundColor: AppColors.white,
                              builder: (context) {
                                //container for product detail
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  content: SizedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data.name ?? '',
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        const SpaceHeight(10.0),
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                          // child: CachedNetworkImage(
                                          //   imageUrl:
                                          //       '${Variables.imageBaseUrl}${data.image}',
                                          //   placeholder: (context, url) =>
                                          //       const CircularProgressIndicator(),
                                          //   errorWidget:
                                          //       (context, url, error) =>
                                          //           const Icon(
                                          //     Icons.food_bank_outlined,
                                          //     size: 80,
                                          //   ),
                                          //   width: 80,
                                          // ),
                                          child: Image.network(
                                            data.image!.contains('http')
                                                ? data.image!
                                                : '${GlobalVariable.baseUrlImage}${data.image}',
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SpaceHeight(10.0),
                                        Text(
                                          data.category?.name ?? '',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SpaceHeight(10.0),
                                        Text(
                                          data.price.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SpaceHeight(10.0),
                                        Text(
                                          data.stock.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SpaceHeight(10.0),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        label: 'Detail',
                        fontSize: 8.0,
                        height: 31,
                      ),
                    ),
                    const SpaceWidth(6.0),
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProductPage(
                                        productRequestModel:
                                            ProductRequestModel(
                                          category_id: data.category!.id!,
                                          description: data.description!,
                                          id: data.id!,
                                           image: data.image != null ? XFile(data.image!) : null,
                                          is_available: data.isAvailable!,
                                          name: data.name!,
                                          price: data.price!,
                                          stock: data.stock!,
                                        ),
                                      )));
                        },
                        label: 'Ubah Produk',
                        fontSize: 8.0,
                        height: 31,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
