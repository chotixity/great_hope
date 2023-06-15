import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../Auth/storage.dart';

class Library extends StatefulWidget {
  Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final storageinstance = Firestore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storageinstance.listFiles(),
        builder: (BuildContext context, AsyncSnapshot<ListResult> snapshot) {
          try {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTile(
                        title: Text('Hello'),
                      );
                    }),
              );
            }
            {
              return CircularProgressIndicator();
            }
          } catch (e) {
            return Text(e.toString());
          }
        });
  }
}
