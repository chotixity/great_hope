import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback ontap;
  const EventWidget(this.icon, this.text, this.ontap, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: theme.primaryColor,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
