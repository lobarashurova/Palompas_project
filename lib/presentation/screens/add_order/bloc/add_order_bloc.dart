import 'package:bloc/bloc.dart';
import 'package:palomaps_project/data/product_model.dart';
import 'package:palomaps_project/di/injection.dart';
import 'package:palomaps_project/domain/app_repository.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc() : super(AddOrderState()) {
    int totalCost = 0;
    final repo = getIt<AppRepository>();
    on<AddOrder>((event, emit) async {
      repo.addProduct(event.productModel);
      emit(state.copyWith(
          products: (await repo.getAllProducts())
              .where((item) => item.productType == event.type)
              .toList(),
          totalCost: (state.totalCost ?? 0) + 12));
    });

    on<ChangeMenu>((event, emit) async {
      emit(state.copyWith(isMenu: event.isMenu));
    });
    on<GetOrdersByType>((event, emit) async {
      List<ProductModel> prodcuts = (await repo.getAllProducts())
          .where((item) => item.productType == event.type)
          .toList();
      for (int i = 0; i < (prodcuts).length; i++) {
        totalCost += (prodcuts)[i].cost;
      }
      emit(state.copyWith(products: prodcuts, totalCost: totalCost.toDouble()));
    });
    on<UpdateProductModel>((event, emit) async {
      emit(state.copyWith(
          totalCost:
              totalCost.toDouble() - event.productModel.cost + event.cost));

      await repo.updateProduct(
        event.cost,
        event.id,
      );
    });
  }
}
