import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../../common/utils/utility_methods.dart';
import '../widgets/colored_button.dart';

class VerifyProfileScreen extends StatefulWidget {
  const VerifyProfileScreen({super.key});

  @override
  State<VerifyProfileScreen> createState() => _VerifyProfileScreenState();
}

class _VerifyProfileScreenState extends State<VerifyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.verifyProfile,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            SizedBox(height: 20.0),
            AddStoryForm(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class AddStoryForm extends StatefulWidget {
  const AddStoryForm({super.key});

  @override
  State<AddStoryForm> createState() => _AddStoryFormState();
}

class _AddStoryFormState extends State<AddStoryForm> {
  String documentType = '';
  final List<String> documentTypes = [
    'Select',
    'Voter ID',
    'Aadhar',
    'PAN',
    'Passport',
  ];
  String documentNumber = '';
  TextEditingController documentNumberTEC = TextEditingController();

  String? _validateDocumentType(String? value) {
    if (value == documentTypes.first) {
      return StringConstants.documentTypeIsRequired;
    }

    return null;
  }

  String? _validateDocumentNumber(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.documentNumberIsRequired;
    }
    return null;
  }

  String selfieImageUrl = '';
  File? _selfieImageFile;
  String docFrontImageUrl = '';
  File? _docFrontImageFile;
  String docBackImageUrl = '';
  File? _docBackImageFile;

  Future<void> _getImageFromGallery(ImageType imageType) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    setState(() {
      if (imageType == ImageType.selfie) {
        _selfieImageFile = File(pickedImage!.path);
      } else if (imageType == ImageType.docFront) {
        _docFrontImageFile = File(pickedImage!.path);
      } else if (imageType == ImageType.docBack) {
        _docBackImageFile = File(pickedImage!.path);
      }
    });
  }

  Future<void> _getImageFromCamera(ImageType imageType) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 20,
    );

    if (imageType == ImageType.selfie) {
      _selfieImageFile = File(pickedImage!.path);
    } else if (imageType == ImageType.docFront) {
      _docFrontImageFile = File(pickedImage!.path);
    } else if (imageType == ImageType.docBack) {
      _docBackImageFile = File(pickedImage!.path);
    }

    setState(() {});
  }

  void _showImageSourceDialog(ImageType imageType) {
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
                  _getImageFromGallery(imageType);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text(
                  StringConstants.camera,
                ),
                onTap: () {
                  _getImageFromCamera(imageType);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String selfieImageError = '';
  bool validateSelfieImage() {
    if (selfieImageUrl.isEmpty && _selfieImageFile == null) {
      setState(() {
        selfieImageError = StringConstants.selfieIsRequired;
      });
      return false;
    } else {
      setState(() {
        selfieImageError = '';
      });
      return true;
    }
  }

  String docFrontImageError = '';
  bool validateDocFrontImage() {
    if (docFrontImageUrl.isEmpty && _docFrontImageFile == null) {
      setState(() {
        docFrontImageError = StringConstants.documentFrontImageIsRequired;
      });
      return false;
    } else {
      setState(() {
        docFrontImageError = '';
      });
      return true;
    }
  }

  String docBackImageError = '';
  bool validateDocBackImage() {
    if (docBackImageUrl.isEmpty && _docBackImageFile == null) {
      setState(() {
        docBackImageError = StringConstants.documentBackImageIsRequired;
      });
      return false;
    } else {
      setState(() {
        docBackImageError = '';
      });
      return true;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    documentNumberTEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    documentType = documentTypes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              if (selfieImageUrl.isEmpty)
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    ),
                    image: _selfieImageFile != null
                        ? DecorationImage(
                            image: FileImage(
                              File(_selfieImageFile!.path),
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
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    ),
                    image: _selfieImageFile != null
                        ? DecorationImage(
                            image: FileImage(
                              File(_selfieImageFile!.path),
                            ),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: CachedNetworkImageProvider(
                              selfieImageUrl,
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
                    _getImageFromCamera(ImageType.selfie);
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorConstants.pickledBluewood,
                    radius: 25,
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          if (selfieImageError.isNotEmpty)
            Text(
              selfieImageError,
              style: TextStyle(
                color: ColorConstants.theRed,
                fontSize: 12.0,
              ),
            ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.documentType,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  validator: _validateDocumentType,
                  value: documentType,
                  hint: Text(documentTypes.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      documentType = newValue!;
                    });
                  },
                  items: documentTypes.map((String profilePerson_) {
                    return DropdownMenuItem<String>(
                      value: profilePerson_,
                      child: Text(profilePerson_),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: documentNumberTEC,
            validator: _validateDocumentNumber,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9 ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to upper case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = newValue.text.toUpperCase();
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 20,
            maxLengthEnforcement: documentNumber.isNotEmpty
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            decoration: InputDecoration(
              counterText: documentNumber.isNotEmpty ? null : "",
              hintText: StringConstants.documentNumber,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.documentNumber,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              setState(() {
                documentNumber = val;
              });
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _showImageSourceDialog(ImageType.docFront);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (docFrontImageUrl.isEmpty)
                  Container(
                    width: (MediaQuery.of(context).size.width - 35),
                    height: (MediaQuery.of(context).size.width - 35) * 0.65,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      image: _docFrontImageFile != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_docFrontImageFile!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage(
                                AssetConstants.blankImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: _docFrontImageFile == null
                        ? Center(
                            child: Text(
                              StringConstants.addDocumentFrontImage,
                              style: TextStyle(
                                color: ColorConstants.tundora,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                else
                  Container(
                    height: (MediaQuery.of(context).size.width - 35) * 0.7,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      image: _docFrontImageFile != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_docFrontImageFile!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: CachedNetworkImageProvider(
                                docFrontImageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                const SizedBox(height: 5),
                if (docFrontImageError.isNotEmpty)
                  Text(
                    docFrontImageError,
                    style: TextStyle(
                      color: ColorConstants.theRed,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _showImageSourceDialog(ImageType.docBack);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (docBackImageUrl.isEmpty)
                  Container(
                    width: (MediaQuery.of(context).size.width - 35),
                    height: (MediaQuery.of(context).size.width - 35) * 0.65,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      image: _docBackImageFile != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_docBackImageFile!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage(
                                AssetConstants.blankImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: _docBackImageFile == null
                        ? Center(
                            child: Text(
                              StringConstants.addDocumentBackImage,
                              style: TextStyle(
                                color: ColorConstants.tundora,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                else
                  Container(
                    height: (MediaQuery.of(context).size.width - 35) * 0.7,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      image: _docBackImageFile != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_docBackImageFile!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: CachedNetworkImageProvider(
                                docBackImageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                const SizedBox(height: 5),
                if (docBackImageError.isNotEmpty)
                  Text(
                    docBackImageError,
                    style: TextStyle(
                      color: ColorConstants.theRed,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Visibility(
            visible: true,
            replacement: Center(
              child: CircularProgressIndicator(
                color: ColorConstants.theWhite,
                strokeWidth: 3.0,
              ),
            ),
            child: ColoredButton(
              radius: 50.0,
              color: ColorConstants.brickRed,
              onPressed: () async {
                var validatedSelfieImage = validateSelfieImage();
                var validatedDocFrontImage = validateDocFrontImage();
                var validatedDocBackImage = validateDocBackImage();
                if (!validatedSelfieImage ||
                    !validatedDocFrontImage ||
                    !validatedDocBackImage) {
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                }
              },
              child: Text(
                StringConstants.submit,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.theWhite,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum ImageType {
  selfie,
  docFront,
  docBack,
}
