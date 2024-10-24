
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/models/place.dart';
import 'package:test_app/app/repository/places_repository.dart';

part 'places_event.dart';

part 'places_state.dart';

@injectable
class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesRepository _repository;

  PlacesBloc(this._repository) : super(const PlacesInitial()) {
    on<PlacesEvent>((event, emit) => switch (event) {
          PlacesStarted() => _started(event, emit),
        });
  }

  Future<void> _started(PlacesStarted event, Emitter<PlacesState> emit) async {
    try {
      emit(const PlacesInitial());
      final response = await _repository.getPlacesMap();
      emit(PlacesData(data: response));
    } catch (e) {
      emit(PlacesError(message: e.toString()));
    }
  }
}
