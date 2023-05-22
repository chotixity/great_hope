import 'package:flutter/material.dart';

class CustomButtton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButtton(this.text, this.onpressed, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll<Color>(theme.primaryColor),
        minimumSize: MaterialStatePropertyAll<Size>(
            Size(MediaQuery.of(context).size.width * .9, 30)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
