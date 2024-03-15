import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/register/presentation/reg/widgets/customtextfield.dart';


class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  Uint8List? _image;
  File? selectedImage;
  TextEditingController _textEditingController = TextEditingController();
  bool _isButtonDisabled = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          color: Colors.white,
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      // Handle back button press
                    },
                    icon: Icon(Icons.arrow_back,
                        size: 40, color: HexColor("#3D7E80")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#3D7E80"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(_image!),
                            backgroundColor: HexColor("#3D7E80"),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: HexColor("#3D7E80"),
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                    Positioned(
                      bottom: 0,
                      left: 26,
                      child: IconButton(
                        onPressed: () {
                          showImagePickerOption(context);
                          // const ImagePickers(),
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: HexColor("#3D7E80"),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                hintTex: "Enter FullName English",
                labelTex: "Enter FullName English",
                type: TextInputType.text,
                obs: false,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(
                    () {
                      _isButtonDisabled = !_formKey.currentState!.validate();
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintTex: "Enter FullName Arabic",
                labelTex: "Enter FullName Arabic",
                type: TextInputType.text,
                obs: false,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _isButtonDisabled = !_formKey.currentState!.validate();
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintTex: "Enter User phone",
                labelTex: "Enter User phone",
                type: TextInputType.text,
                obs: false,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _isButtonDisabled = !_formKey.currentState!.validate();
                  });
                },
                inputformatter: [
                  LengthLimitingTextInputFormatter(
                      11), // Limit to 11 characters
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintTex: "Enter Email",
                labelTex: "Enter Email",
                type: TextInputType.emailAddress,
                obs: false,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _isButtonDisabled = !_formKey.currentState!.validate();
                  });
                },
                inputformatter: [
                  FilteringTextInputFormatter.allow(
                    RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Your logic here
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#3D7E80"),
                  padding: EdgeInsets.symmetric(
                      horizontal: 40), // Set the desired width
// Set the desired color
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onConfirmButtonPressed() {
    // Implement your logic when the confirm button is pressed
    // You can access the entered text using _textEditingController.text
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); // Close the modal sheet
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
