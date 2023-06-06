import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/eventProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/event_widget_add.dart';
import '../models/event.dart';
import '../Auth/storage.dart';
import 'package:file_picker/file_picker.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final eventName = TextEditingController();
  final eventLocation = TextEditingController();
  final date = TextEditingController();
  final _firesoreInstance = Firestore();

  void _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
    );
    final formattedDate = DateFormat.yMd().format(pickedDate!);
    setState(() {
      date.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EventWidget(Icons.event_note, 'add an event', () {
            showBottomSheet(
              context: context,
              builder: ((BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: eventName,
                          decoration: const InputDecoration(
                              label: Text('Event Name'),
                              contentPadding: EdgeInsets.only(left: 20)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: eventLocation,
                          decoration: const InputDecoration(
                              label: Text('Event location'),
                              contentPadding: EdgeInsets.only(left: 20)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          readOnly: true,
                          controller: date,
                          onTap: _selectDate,
                          decoration: const InputDecoration(
                              label: Text('Event Date'),
                              contentPadding: EdgeInsets.only(left: 20)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (eventName.text.isNotEmpty &&
                              eventLocation.text.isNotEmpty &&
                              date.text.isNotEmpty) {
                            // provider.addEvent(newEvent);
                            _firesoreInstance.addEvent(
                                eventName.text, eventLocation.text, date.text);
                          }
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save Event'),
                      )
                    ],
                  ),
                );
              }),
            );
          }),
          EventWidget(Icons.library_books_outlined, 'add a document', () {
            showBottomSheet(
                context: context,
                builder: ((BuildContext context) {
                  return Container(
                    height: 300,
                    color: Colors.white,
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
          EventWidget(Icons.notifications_active, 'add a notification', () {}),
        ],
      ),
    );
  }
}
