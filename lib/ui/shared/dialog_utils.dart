// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text(
        'Thông Báo',
        style: TextStyle(fontFamily: 'arial', fontWeight: FontWeight.bold),
      ),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Không',
            style: TextStyle(
                fontFamily: 'arial',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
        ),
        TextButton(
          // ignore: sort_child_properties_last
          child: const Text(
            'Có',
            style: TextStyle(
                fontFamily: 'arial',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(ctx).pop(true);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.red), // Đặt màu nền
          ),
        ),
      ],
    ),
  );
}

Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('An Error Occurred!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        )
      ],
    ),
  );
}
