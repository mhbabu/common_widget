import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePrickerScreen extends StatefulWidget {
  const ImagePrickerScreen({super.key});

  @override
  State<ImagePrickerScreen> createState() => _ImagePrickerScreenState();
}

class _ImagePrickerScreenState extends State<ImagePrickerScreen> {
  File? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      // Check for null
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    } else {
      // User canceled picking
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ImagePrickerScreen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // 👈 This fixes the arrow color
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // vertically center
            crossAxisAlignment:
                CrossAxisAlignment.center, // horizontally center
            children: [
              MaterialButton(
                height: 50,
                minWidth: 200,
                color: const Color(0xff1D1E22),
                onPressed: () => _pickImageFromGallery(),
                child: const Text(
                  'Pick Image from Gallery',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 14),
              MaterialButton(
                height: 50,
                minWidth: 200,
                color: const Color(0xff1D1E22),
                onPressed: () {
                  print('babu');
                },
                child: const Text(
                  'Pick Image from Camera',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 14),
              _selectedImage != null
                  ? Image.file(_selectedImage!)
                  : Text('Please select an Image'),
            ],
          ),
        ),
      ),
    );
  }
}
