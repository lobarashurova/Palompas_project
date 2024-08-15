part of 'order_show_bloc.dart';

class OrderShowState {
  List<TotalModel>? products;

  OrderShowState({this.products});

  OrderShowState copyWith({List<TotalModel>? products}) {
    return OrderShowState(products: products ?? this.products);
  }
}
