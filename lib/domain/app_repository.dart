import 'package:palomaps_project/data/product_model.dart';

abstract class AppRepository {
  Future<void> addProduct(ProductModel productModel);

  Future<void> updateProduct(int cost, int id);

  Future<List<ProductModel>> getAllProducts();
}
