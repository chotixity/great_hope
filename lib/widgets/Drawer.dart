// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:flutter/services.dart';
import '../screens/events.dart';
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
      final image = await ImagePicker.platform
          .pickImage(source: ImageSource.gallery, maxWidth: 600);
      if (image == null) return;
      //final img = await saveImagePermanently(image.path);

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(image.path);
      final savedImage =
          await File(image.path).copy('${appDir.path}/$fileName');
      setState(() {
        this.image = savedImage;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: image == null
                      ? const CircleAvatar(
                          radius: 100,
                          child: Icon(
                            Icons.person,
                            size: 100,
                          ),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(
                            image!,
                          ),
                        ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FirebaseAuth.instance.currentUser != null
                ? Text(
                    '${FirebaseAuth.instance.currentUser?.email}',
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text(''),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'check',
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Events.routeName);
                  },
                  child: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Contributions',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'About',
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'About Great Hope',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
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
