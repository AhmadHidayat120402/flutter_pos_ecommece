import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/components/dashed_line.dart';
import 'package:flutter_pos_ecommerce/core/components/spaces.dart';
import 'package:flutter_pos_ecommerce/core/extensions/date_time_ext2.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/report/bloc/transaction_report/transaction_report_bloc.dart';

class TransactionReportPage extends StatefulWidget {
  const TransactionReportPage({super.key});

  @override
  State<TransactionReportPage> createState() => _TransactionReportPageState();
}

class _TransactionReportPageState extends State<TransactionReportPage> {
  int selectedMenu = 0;
  String title = 'Summary Sales Report';
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String searchDateFormatted =
        '${fromDate.toFormattedDate2()} to ${toDate.toFormattedDate2()}';
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transaction Report"),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<TransactionReportBloc, TransactionReportState>(
              builder: (context, state) {
                final totalRevenue = state.maybeMap(
                  orElse: () => 0,
                  loaded: (value) {
                    return value.transactionReport.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.total_cost,
                    );
                  },
                );

                final subTotal = state.maybeMap(
                  orElse: () => 0,
                  loaded: (value) {
                    return value.transactionReport.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.subtotal,
                    );
                  },
                );

                final discount = state.maybeMap(
                  orElse: () => 0,
                  loaded: (value) {
                    return value.transactionReport.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.discount,
                    );
                  },
                );

                final tax = state.maybeMap(
                  orElse: () => 0,
                  loaded: (value) {
                    return value.transactionReport.fold(
                      0,
                      (previousValue, element) => previousValue + element.tax,
                    );
                  },
                );
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: Text('No Data'),
                  );
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loaded: (transactionReport) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          searchDateFormatted,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SpaceHeight(16.0),

                      // REVENUE INFO
                      ...[
                        Text('REVENUE : $totalRevenue'),
                        const SpaceHeight(8.0),
                        const DashedLine(),
                        const DashedLine(),
                        const SpaceHeight(8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text('$subTotal'),
                          ],
                        ),
                        const SpaceHeight(4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Discount'),
                            Text('$discount'),
                          ],
                        ),
                        const SpaceHeight(4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tax'),
                            Text('$tax'),
                          ],
                        ),
                        const SpaceHeight(8.0),
                        const DashedLine(),
                        const DashedLine(),
                        const SpaceHeight(8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TOTAL'),
                            Text('$totalRevenue'),
                          ],
                        ),
                      ],
                      const SpaceHeight(32.0),
                    ],
                  );
                });
              },
            ),
          ),
        ));
  }
}
