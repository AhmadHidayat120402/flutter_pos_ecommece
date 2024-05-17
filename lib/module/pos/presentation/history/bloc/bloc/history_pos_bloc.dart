import 'package:bloc/bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_pos_event.dart';
part 'history_pos_state.dart';
part 'history_pos_bloc.freezed.dart';

class HistoryPosBloc extends Bloc<HistoryPosEvent, HistoryPosState> {
  HistoryPosBloc() : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());
      final data = await ProductLocalDatasource.instance.getAllOrder();
      emit(_Loaded(data));
    });
  }
}
