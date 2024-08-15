class ProductModel {
  final int? id;
  final String name;
  final int cost;
  final String roomNumber;
  final String productType;

  ProductModel(
      {this.id,
      required this.name,
      required this.cost,
      required this.roomNumber,
      required this.productType});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'product_menu': roomNumber,
      'product_type': productType,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'],
        name: map['name'],
        cost: map['cost'],
        roomNumber: map['product_menu'],
        productType: map['product_type']);
  }
}
