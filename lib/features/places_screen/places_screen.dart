import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/routing/app_router.dart';
import 'package:test_app/features/places_screen/bloc/places_bloc.dart';
import 'package:test_app/utils/widget_ext.dart';

@RoutePage()
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Столики'),
      ),
      body: BlocBuilder<PlacesBloc, PlacesState>(
        builder: (context, state) {
          if (state is! PlacesData) return const Center(child: CircularProgressIndicator());

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.data.keys
                  .map((k) => Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _HeaderCard(title: k),
                          const SizedBox(height: 16),
                          ...state.data[k]!
                              .map((v) => _PlaceCard(title: v.name, placeId: v.id,))
                              .interleave(context, (_) => const SizedBox(height: 8)),
                        ],
                      )))
                  .interleave(context, (_) => const SizedBox(width: 8)),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 215, 173, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  const _PlaceCard({
    required this.title,
    required this.placeId,
  });

  final String title;
  final int placeId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(OrderRoute(placeName: title, placeId: placeId)),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.black),
        ),
        width: 170,
        height: 110,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
