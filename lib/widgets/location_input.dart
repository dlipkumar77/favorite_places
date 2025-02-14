//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
//import 'package:http/http.dart' as http;
import '/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLoaction});
  final void Function(PlaceLocation location) onSelectLoaction;
  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickLocation;
  var _isGettingLocation = false;

  //static value  dont have  google API
  void _getCurrentLocation() {
    setState(() {
      final lat = 40.714232;
      final lng = -73.9612889;
      final address = '277 Bedford Avenue, Brooklyn, NY 11211, USA';
      _pickLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
    });

    widget.onSelectLoaction(_pickLocation!);
  }

  /*
  // map snapshot url -> google map static api; remove unwanted & one markers enough others delete; signature too
  String get locationImage {
    if (_pickLocation == null) {
      return '';
    }
    final lat = _pickLocation!.latitude;
    final lng = _pickLocation!.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C4$lat,$lng&key=YOUR_API_KEY';
  }

  
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      return;
    }

    // optional or must use error handler to response

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?$lat,$lng&key=YOUR_API_KEY');

    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];

    setState(() {
      _pickLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
      _isGettingLocation = false;
    });

    widget.onSelectLoaction(_pickLocation!);

    //print(locationData.latitude);
    //print(locationData.longitude);
  }

  */

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No lolcation chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

/*
hide these because API key dont have

    if (_pickLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    */

    if (_isGettingLocation) {
      previewContent = CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Get current location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
