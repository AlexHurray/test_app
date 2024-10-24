// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/db/local_database.dart' as _i4;
import 'app/repository/orders_repository.dart' as _i5;
import 'app/repository/places_repository.dart' as _i6;
import 'app/repository/products_in_order_repository.dart' as _i7;
import 'app/repository/products_repository.dart' as _i8;
import 'app/routing/app_router.dart' as _i3;
import 'features/order_screen/bloc/products_bloc.dart' as _i11;
import 'features/orders_screen/bloc/orders_bloc.dart' as _i9;
import 'features/places_screen/bloc/places_bloc.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.LocalDatabase>(_i4.LocalDatabase());
  gh.lazySingleton<_i5.OrdersRepository>(
      () => _i5.OrdersProvider(gh<_i4.LocalDatabase>()));
  gh.lazySingleton<_i6.PlacesRepository>(
      () => _i6.PlacesProvider(gh<_i4.LocalDatabase>()));
  gh.lazySingleton<_i7.ProductsInOrderRepository>(
      () => _i7.ProductsInOrderProvider(gh<_i4.LocalDatabase>()));
  gh.lazySingleton<_i8.ProductsRepository>(
      () => _i8.ProductsProvider(gh<_i4.LocalDatabase>()));
  gh.factory<_i9.OrdersBloc>(() => _i9.OrdersBloc(gh<_i5.OrdersRepository>()));
  gh.factory<_i10.PlacesBloc>(
      () => _i10.PlacesBloc(gh<_i6.PlacesRepository>()));
  gh.factory<_i11.ProductsBloc>(
      () => _i11.ProductsBloc(gh<_i8.ProductsRepository>()));
  return getIt;
}
