part of 'add_order_bloc.dart';

class AddOrderState {
  bool? isMenu = true;
  List<ProductModel>? products;
  double? totalCost;

  AddOrderState({this.isMenu, this.products, this.totalCost});

  AddOrderState copyWith(
      {bool? isMenu, List<ProductModel>? products, double? totalCost}) {
    return AddOrderState(
        isMenu: isMenu ?? this.isMenu,
        products: products ?? this.products,
        totalCost: totalCost ?? this.totalCost);
  }
}
