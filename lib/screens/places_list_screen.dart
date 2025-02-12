import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/widgets/places_list.dart';
import '/screens/add_place.dart';
import '/providers/user_places.dart';

class PlacesListScreen extends ConsumerWidget {
  const PlacesListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPlaceScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }
}
