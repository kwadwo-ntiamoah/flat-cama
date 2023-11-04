import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/colors.dart';

class CamaApply extends StatelessWidget {
  const CamaApply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimaryColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('COMPLETE'),
      ),
      body: SingleChildScrollView(
        child: CamaForm(),
      ),
    );
  }
}

class CamaForm extends StatefulWidget {
  const CamaForm({super.key});

  @override
  State<CamaForm> createState() => _CamaFormState();
}

class _CamaFormState extends State<CamaForm> {

  File? _image;
  // Implementing the image picker
  Future<void> _pickImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Center(
            child: GestureDetector(
              child: const Text('Select An Image'),
              onTap: ()=>_pickImage(),
            ),
          ),
        ],
      ),
    );
  }
}
