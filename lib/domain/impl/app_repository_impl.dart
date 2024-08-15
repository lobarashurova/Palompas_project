import 'package:palomaps_project/data/product_model.dart';
import 'package:palomaps_project/di/injection.dart';
import 'package:palomaps_project/domain/app_repository.dart';
import 'package:palomaps_project/domain/database/product_database.dart';
import 'package:sqflite/sqflite.dart';

class AppRepositoryImpl extends AppRepository {
  final helper = getIt<DatabaseHelper>();

  @override
  Future<void> addProduct(ProductModel productModel) async {
    final db = await helper.database;

    await db.insert(
      'products',
      productModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final db = await helper.database;

    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> updateProduct(int cost, int id) async {
    final db = await helper.database;

    await db.update(
      'products',
      {'cost': cost},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
