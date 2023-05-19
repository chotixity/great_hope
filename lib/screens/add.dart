import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/event_widget_add.dart';
import 'package:file_picker/file_picker.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Event(Icons.event_note, 'add an event', () {
            showBottomSheet(
              context: context,
              builder: ((BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.grey,
                  child: Center(),
                );
              }),
            );
          }),
          Event(Icons.library_books_outlined, 'add a document', () {
            showBottomSheet(
                context: context,
                builder: ((BuildContext context) {
                  return Container(
                    height: 300,
                    color: Colors.grey,
                    child: Flexible(
                      child: Column(
                        children: [
                          TextField(),
                          TextButton(
                              onPressed: () async {
                                final result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;
                                final file = result;
                                print(file.names);
                              },
                              child: const Text('Pick Document'))
                        ],
                      ),
                    ),
                  );
                }));
          }),
          Event(Icons.notifications_active, 'add a notification', () {}),
        ],
      ),
    );
  }
}
