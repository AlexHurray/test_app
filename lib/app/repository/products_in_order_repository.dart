import 'package:injectable/injectable.dart';
import 'package:test_app/app/db/local_database.dart';
import 'package:test_app/app/models/product_in_order.dart';
import 'package:test_app/app/models/order.dart' as o;
import 'package:sqflite/sqflite.dart' as sqlite;


abstract interface class ProductsInOrderRepository {
  Future<List<ProductInOrder>> getProductsInOrder(int orderId);

  Future<o.Order?> getActiveOrder(int placeId);

  Future<void> updateProduct(int productId, int amount, int orderId);

  Future<int> createOrder(int placeId);

  Future<void> insertProduct(int productId, int orderId);

  Future<void> closeOrder(int placeId);
}

@LazySingleton(as: ProductsInOrderRepository)
class ProductsInOrderProvider implements ProductsInOrderRepository {
  final LocalDatabase _db;

  const ProductsInOrderProvider(this._db);

  @override
  Future<List<ProductInOrder>> getProductsInOrder(int orderId) async {
    final data = await _db.database.rawQuery('''
      select Products.id, Products.name, Products.image, Products.price, Cart.amount FROM Cart LEFT JOIN Products ON Products.id = Cart.productId where Cart.orderId = $orderId;
    ''');

    final List<ProductInOrder> products = data.map((e) => ProductInOrder.fromJson(e)).toList();

    return products;
  }

  @override
  Future<o.Order?> getActiveOrder(int placeId) async {
    final data = await _db.database.rawQuery('''
      select Orders.id, Orders.isActive, Orders.createdAt, Places.name as placeName, Places.id as placeId FROM Orders LEFT JOIN Places ON Places.id = $placeId WHERE Orders.placeId = $placeId and Orders.isActive = 1;
    ''');

    if (data.isEmpty) {
      return null;
    }

    return o.Order.fromJson(data.last);
  }

  @override
  Future<int> createOrder(int placeId) async {
    final id = await _db.database.rawInsert(
        "INSERT INTO orders (placeId, createdAt) VALUES ('$placeId', '${DateTime.now().toIso8601String()}')");

    return id;
  }

  @override
  Future<void> closeOrder(int placeId) async {
    await _db.database.rawUpdate("update orders set isActive = 0 where placeId = $placeId and isActive = 1;");
  }

  @override
  Future<void> updateProduct(int productId, int amount, int orderId) async {
    if (amount <= 0) {
      await _db.database.rawDelete("delete from Cart where productId = $productId and orderId = $orderId;");
    } else {
      await _db.database.rawUpdate("update cart set amount = $amount where productId = $productId and orderId = $orderId;");
    }
  }

  @override
  Future<void> insertProduct(int productId, int orderId) async {
    await _db.database.transaction((txn) async {
      int count = sqlite.Sqflite.firstIntValue(await txn.rawQuery(
              'select count(*) as amount from cart where productId = $productId and orderId = $orderId;')) ??
          0;
      if (count <= 0) {
        await txn.rawUpdate(
            "insert or ignore into cart(productId, orderId, amount) values ($productId, $orderId, 1);");
      } else {
        await txn.rawUpdate(
            "update cart set amount = (select amount+1 from cart where productId = $productId and orderId = $orderId) where productId = $productId and orderId = $orderId;");
      }
      return;
    });
  }
}
