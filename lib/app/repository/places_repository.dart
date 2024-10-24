import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/db/local_database.dart';
import 'package:test_app/app/models/place.dart';

abstract interface class PlacesRepository {
  Future<Map<String, List<Place>>> getPlacesMap();
}

@LazySingleton(as: PlacesRepository)
class PlacesProvider implements PlacesRepository {
  final LocalDatabase _db;

  const PlacesProvider(this._db);

  @override
  Future<Map<String, List<Place>>> getPlacesMap() async {
    final data = await _db.database.rawQuery('''
      select Places.id, Places.name, PlacesType.name as typeName FROM Places LEFT JOIN PlacesType ON Places.typeId = PlacesType.id;
    ''');

    final List<Place> places = data.map((e) => Place.fromJson(e)).toList();

    return groupBy(places, (p) => p.typeName);
  }
}
