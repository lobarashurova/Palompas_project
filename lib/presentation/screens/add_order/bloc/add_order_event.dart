part of 'add_order_bloc.dart';

abstract class AddOrderEvent {}

class AddOrder extends AddOrderEvent {
  ProductModel productModel;
  String type;

  AddOrder(this.productModel, this.type);
}

class ChangeMenu extends AddOrderEvent {
  bool isMenu;

  ChangeMenu(this.isMenu);
}

class GetOrdersByType extends AddOrderEvent {
  String type;

  GetOrdersByType(this.type);
}

class UpdateProductModel extends AddOrderEvent {
  int id;
  int cost;
  ProductModel productModel;

  UpdateProductModel(this.id, this.cost, this.productModel);
}
