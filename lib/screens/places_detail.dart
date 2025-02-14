import 'package:flutter/material.dart';
import '/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;

/*
  // we dont have googel api so use camera image as location image
  // map snapshot url -> google map static api; remove unwanted & one markers enough others delete; signature too
  String get locationImage {
    // dont need check because we have value
    // if (_pickLocation == null) {
    //   return '';
    // }
    final lat = place.location.latitude;
    final lng = place.location.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C4$lat,$lng&key=YOUR_API_KEY';
  }

  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 76,
                    backgroundImage: FileImage(
                      place.image,
                    ),
                  ),
                  /*
                  CircleAvatar(
                    radius: 76,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                  */
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      place.location.address,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
