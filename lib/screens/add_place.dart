import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/user_places.dart';
import '/widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  void _savePlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlacesNotifier.notifier)
        .addPlace(enteredText, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              controller: _titleController,
            ),
            SizedBox(
              height: 10,
            ),
            ImageInput(
              onPicKImage: (image) {
                _selectedImage = image;
              },
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
            )
          ],
        ),
      ),
    );
  }
}
