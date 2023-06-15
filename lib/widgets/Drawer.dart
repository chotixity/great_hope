// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DrawerS extends StatefulWidget {
  const DrawerS({super.key});

  @override
  State<DrawerS> createState() => _DrawerSState();
}

class _DrawerSState extends State<DrawerS> {
  File? image;

  Future _pickImage() async {
    try {
      final image =
          await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final img = await saveImagePermanently(image.path);
      setState(() {
        this.image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: image == null
                      ? const FlutterLogo(
                          size: 100,
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(
                            image!,
                          ) as ImageProvider),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: theme.primaryColor,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('You are Logged in as '),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
