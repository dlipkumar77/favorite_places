import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/models/place.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key, this.isSelecting = true})
      : location = PlaceLocation(
          latitude: 37.422,
          longitude: -122.084,
          address: '',
        );

  // const MapScreen({
  //   super.key,
  //   this.location =
  //       const PlaceLocation(latitude: 37.422, longitude: -122.084, address: ''), // const problem so above use
  // });
  final PlaceLocation location;
  final bool isSelecting;
  @override
  State<MapScreen> createState() {
    return _MapScreen();
  }
}

class _MapScreen extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your Loaction'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: MarkerId('m1'),
            position:
                LatLng(widget.location.latitude, widget.location.longitude),
          ),
        },
      ),
    );
  }
}
