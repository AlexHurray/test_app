import 'package:injectable/injectable.dart';
import 'package:test_app/app/db/local_database.dart';
import 'package:test_app/app/models/order.dart' as o;

abstract interface class OrdersRepository {
  Future<List<o.Order>> getOrders();
}

@LazySingleton(as: OrdersRepository)
class OrdersProvider implements OrdersRepository {
  final LocalDatabase _db;

  const OrdersProvider(this._db);

  @override
  Future<List<o.Order>> getOrders() async {
    final data = await _db.database.rawQuery('''
      select Orders.id, Orders.isActive, Orders.createdAt, Places.name as placeName, Places.id as placeId, coalesce(c.summary, 0.0) as totalPrice FROM Orders 
      LEFT JOIN Places ON Places.id = Orders.placeId 
      left join (select c.orderId, sum(p.price*c.amount) summary
              from cart c
                       left join products p on c.productId = p.id
              group by c.orderId) c on c.orderId = Orders.id;
    ''');

    final List<o.Order> orders = data.map((e) => o.Order.fromJson(e)).toList();

    return orders;
  }
}
