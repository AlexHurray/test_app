part of 'places_bloc.dart';

sealed class PlacesEvent extends Equatable {
  const PlacesEvent();
}

class PlacesStarted extends PlacesEvent {
  const PlacesStarted();

  @override
  List<Object?> get props => [];
}
