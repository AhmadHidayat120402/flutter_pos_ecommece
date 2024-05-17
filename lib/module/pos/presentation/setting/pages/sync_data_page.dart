import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import '../../../../../core/constants/colors.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({super.key});

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Data'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocConsumer<AllProductBloc, AllProductState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                loaded: (_) async {
                  await ProductLocalDatasource.instance.deleteAllProducts();
                  await ProductLocalDatasource.instance
                      .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: AppColors.primary,
                      content: Text(
                        'Sync data success',
                      )));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<AllProductBloc>()
                            .add(const AllProductEvent.getAllProducts());
                      },
                      child: const Text('Sync Produk'));
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
          const Divider(),
          BlocConsumer<SyncOrderBloc, SyncOrderState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                loaded: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sync Order Success'),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<SyncOrderBloc>()
                          .add(const SyncOrderEvent.syncOrder());
                    },
                    child: const Text('Sync Order'),
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
        ],
      ),
    );
  }
}
