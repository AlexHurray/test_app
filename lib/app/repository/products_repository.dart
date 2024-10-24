import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/db/local_database.dart';
import 'package:test_app/app/models/product.dart';

abstract interface class ProductsRepository {
  Future<Map<String, List<Product>>> getProductsMap();
}

@LazySingleton(as: ProductsRepository)
class ProductsProvider implements ProductsRepository {
  final LocalDatabase _db;

  const ProductsProvider(this._db);

  @override
  Future<Map<String, List<Product>>> getProductsMap() async {
    final data = await _db.database.rawQuery('''
      select Products.id, Products.name, Products.image, Products.price, Groups.name as groupName FROM Products LEFT JOIN Groups ON Products.groupId = Groups.id;
    ''');

    final List<Product> products = data.map((e) => Product.fromJson(e)).toList();

    return groupBy(products, (p) => p.groupName);
  }
}
