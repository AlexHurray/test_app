part of 'places_bloc.dart';

sealed class PlacesState extends Equatable {
  const PlacesState();
}

/// initial state
class PlacesInitial extends PlacesState {
  const PlacesInitial() : super();

  @override
  List<Object> get props => [];
}

/// loading state
final class PlacesLoading extends PlacesState {
  const PlacesLoading();

  @override
  List<Object> get props => [];
}

/// main data state
final class PlacesData extends PlacesState {
  final Map<String, List<Place>> data;

  const PlacesData({required this.data});

  @override
  List<Object> get props => [data];
}

/// error state
final class PlacesError extends PlacesState {
  final String message;

  const PlacesError({required this.message}) : super();

  @override
  List<Object> get props => [message];
}
