import 'package:flutter/material.dart';

class HotelAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final Function onConfirm;

  const HotelAlertDialog({
    required this.title,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
          style: const TextStyle(
              color: Colors.blueAccent, fontWeight: FontWeight.bold)),
      content: Text(
        content,
        style: const TextStyle(color: Colors.blueGrey),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
          child: Text(confirmText),
        ),
      ],
    );
  }
}
