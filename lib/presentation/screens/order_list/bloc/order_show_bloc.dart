import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:palomaps_project/data/product_model.dart';
import 'package:palomaps_project/data/total_model.dart';
import 'package:palomaps_project/di/injection.dart';
import 'package:palomaps_project/domain/app_repository.dart';

part 'order_show_event.dart';
part 'order_show_state.dart';

class OrderShowBloc extends Bloc<OrderShowEvent, OrderShowState> {
  OrderShowBloc() : super(OrderShowState()) {
    final repo = getIt<AppRepository>();
    on<GetAllProducts>((event, emit) async {
      List<TotalModel> list = [];
      List<ProductModel> prodcuts = (await repo.getAllProducts());
      HashSet<String> rooms = HashSet<String>();
      for (int i = 0; i < prodcuts.length; i++) {
        rooms.add(prodcuts[i].productType);
      }
      for (int i = 0; i < rooms.toList().length; i++) {
        List<ProductModel> myList = prodcuts
            .where((element) => element.productType == rooms.toList()[i])
            .toList();
        int cost = 0;
        for (int i = 0; i < myList.length; i++) {
          cost += myList[i].cost;
        }
        list.add(TotalModel(rooms.toList()[i], myList, cost));
      }

      emit(state.copyWith(products: list));
    });
  }
}
