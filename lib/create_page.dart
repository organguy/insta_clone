import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePage extends StatefulWidget {
  final User user;

  const CreatePage(this.user, {Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  File? _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageFile,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            uploadImage();
          },
          color: Colors.black,
        )
      ],
    );
  }

  void uploadImage() {
    final firebaseStorgaeRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child("${DateTime.now().millisecondsSinceEpoch}.png");

    final task = firebaseStorgaeRef.putFile(_image!,
        SettableMetadata(customMetadata: {'contentType': 'image/png'}));

    task.then((value) => {
      uploadDB(value)
    });
  }

  void uploadDB(TaskSnapshot value) {
    Future<String> downloadURL = value.ref.getDownloadURL();

    downloadURL.then((uri) => {
          FirebaseFirestore.instance.collection('post').add({
            'photoUrl': uri.toString(),
            'contents': textEditingController.text,
            'email': widget.user.email,
            'displayName': widget.user.displayName,
            'userPhotoUrl': widget.user.photoURL
          }).then((value) => {
            Navigator.pop(context)
          })
        });
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image == null ? const Text('No Image') : Image.file(_image!),
          TextField(
            decoration: const InputDecoration(hintText: '내용을 입력하세요'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  void _getImageFile() {
    ImagePicker.platform
        .pickImage(source: ImageSource.gallery)
        .then((image) => {
              setState(() {
                _image = File(image!.path);
              })
            });
  }
}
