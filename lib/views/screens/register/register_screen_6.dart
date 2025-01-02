import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/asset_constants.dart';
import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class RegisterScreen6 extends StatefulWidget {
  const RegisterScreen6({super.key});

  @override
  State<RegisterScreen6> createState() => _RegisterScreen6State();
}

class _RegisterScreen6State extends State<RegisterScreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color4,
      appBar: AppBar(
        title: const Text(StringConstants.register),
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Text(
              StringConstants.uploadPhoto,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm6(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm6 extends StatefulWidget {
  const RegisterForm6({super.key});

  @override
  State<RegisterForm6> createState() => _RegisterForm6State();
}

class _RegisterForm6State extends State<RegisterForm6> {
  String imageUrl = '';
  File? _imageFile;

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    setState(() {
      _imageFile = File(pickedImage!.path);
    });
  }

  Future<void> _getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 20,
    );

    _imageFile = File(pickedImage!.path);

    setState(() {});
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            StringConstants.selectImageSource,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text(
                  StringConstants.gallery,
                ),
                onTap: () {
                  _getImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text(
                  StringConstants.camera,
                ),
                onTap: () {
                  _getImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (imageUrl.isEmpty)
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                  image: _imageFile != null
                      ? DecorationImage(
                          image: FileImage(
                            File(_imageFile!.path),
                          ),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage(
                            AssetConstants.userImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
              )
            else
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                  image: _imageFile != null
                      ? DecorationImage(
                          image: FileImage(
                            File(_imageFile!.path),
                          ),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: CachedNetworkImageProvider(
                            imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            Positioned(
              right: 15,
              bottom: 15,
              child: GestureDetector(
                onTap: () {
                  _showImageSourceDialog();
                },
                child: CircleAvatar(
                  backgroundColor: ColorConstants.color6,
                  radius: 25,
                  child: const Icon(
                    Icons.edit,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60.0),
        Visibility(
          visible: true,
          replacement: Center(
            child: CircularProgressIndicator(
              color: ColorConstants.textWhite,
              strokeWidth: 3.0,
            ),
          ),
          child: ColoredButton(
            color: ColorConstants.color1,
            onPressed: () async {
              if (false) {
                FocusScope.of(context).unfocus();
              }
            },
            child: Text(
              StringConstants.register,
              style: TextStyle(
                fontSize: 18,
                color: ColorConstants.textWhite,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
