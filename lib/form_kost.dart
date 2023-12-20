import 'package:flutter/material.dart';
import 'dart:io'; // Add this import for File class
import 'package:image_picker/image_picker.dart';

class FormKostPage extends StatefulWidget {
  @override
  _FormKostPageState createState() => _FormKostPageState();
}

class _FormKostPageState extends State<FormKostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _namaKostController = TextEditingController();
  TextEditingController _hargaKostController = TextEditingController();
  TextEditingController _alamatKostController = TextEditingController();
  TextEditingController _nomorPemilikController = TextEditingController();
  TextEditingController _fasilitasKostController = TextEditingController();

  // Initialize _fotoKostURL
  String _fotoKostURL = '';
  XFile? _imageFile; // XFile is a class provided by image_picker

  // Function to pick an image from the device
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Kost'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nama Kost
              TextFormField(
                controller: _namaKostController,
                decoration: InputDecoration(labelText: 'Nama Kost'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Kost cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Harga Kost
              TextFormField(
                controller: _hargaKostController,
                decoration: InputDecoration(labelText: 'Harga Kost'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Kost cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Alamat Kost
              TextFormField(
                controller: _alamatKostController,
                decoration: InputDecoration(labelText: 'Alamat Kost'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat Kost cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Nomor Pemilik Kost
              TextFormField(
                controller: _nomorPemilikController,
                decoration: InputDecoration(labelText: 'Nomor Pemilik Kost'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Pemilik Kost cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Fasilitas Kost
              TextFormField(
                controller: _fasilitasKostController,
                decoration: InputDecoration(labelText: 'Fasilitas Kost'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fasilitas Kost cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Foto Kost (Upload File)
              ElevatedButton(
                onPressed: () {
                  _pickImage(); // Call the image picker function
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text('Upload Foto Kost'),
              ),
              SizedBox(height: 8),

              // Display selected image
              _imageFile != null
                  ? Image.file(File(_imageFile!.path))
                  : SizedBox.shrink(),

              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform save or upload operation
                    // You may want to send this data to a database or another storage mechanism
                    // For simplicity, we print the values here
                    print('Nama Kost: ${_namaKostController.text}');
                    print('Harga Kost: ${_hargaKostController.text}');
                    print('Alamat Kost: ${_alamatKostController.text}');
                    print(
                        'Nomor Pemilik Kost: ${_nomorPemilikController.text}');
                    print('Fasilitas Kost: ${_fasilitasKostController.text}');
                    print('Foto Kost URL: $_fotoKostURL');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}