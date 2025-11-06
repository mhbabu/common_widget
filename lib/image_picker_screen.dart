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
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    } else {
      print('No image selected');
    }
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (returnedImage != null) {
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Picker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // 👈 closes the screen
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 50,
                minWidth: 200,
                color: const Color(0xff1D1E22),
                onPressed: _pickImageFromGallery,
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
                onPressed: _pickImageFromCamera,
                child: const Text(
                  'Pick Image from Camera',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 14),
              _selectedImage != null
                  ? Column(
                      children: [
                        Image.file(_selectedImage!, height: 200),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.check),
                          label: const Text('Use this Image'),
                        ),
                      ],
                    )
                  : const Text('Please select an image'),
            ],
          ),
        ),
      ),
    );
  }
}
