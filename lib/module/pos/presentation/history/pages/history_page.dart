import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/history/bloc/bloc/history_pos_bloc.dart';

import '../../../../../core/components/spaces.dart';
import '../models/history_transaction_model.dart';
import '../widgets/history_transaction_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryPosBloc>().add(const HistoryPosEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    // final indeValue = ValueNotifier(0);

    // final List<HistoryTransactionModel> historyTransactions = [
    //   HistoryTransactionModel(
    //     name: 'Payment 1',
    //     category: 'Category A',
    //     price: 50000,
    //   ),
    //   HistoryTransactionModel(
    //     name: 'Payment 2',
    //     category: 'Category B',
    //     price: 75000,
    //   ),
    //   HistoryTransactionModel(
    //     name: 'Payment 3',
    //     category: 'Category C',
    //     price: 100000,
    //   ),
    // ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('History Orders',
              style: TextStyle(fontWeight: FontWeight.bold)),
          // backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<HistoryPosBloc, HistoryPosState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(
                child: Text('No Data'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (histories) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  itemCount: histories.length,
                  separatorBuilder: (context, index) => const SpaceHeight(8.0),
                  itemBuilder: (context, index) => HistoryTransactionCard(
                    padding: paddingHorizontal,
                    data: histories[index],
                  ),
                );
              },
            );
          },
        ));
  }
}
