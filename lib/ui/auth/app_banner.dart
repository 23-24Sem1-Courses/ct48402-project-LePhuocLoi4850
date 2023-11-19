// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 94.0,
      ),
      decoration: BoxDecoration(
        color: Colors.green,
        image: const DecorationImage(image: AssetImage('assets/image/logo.png')),
        borderRadius: BorderRadius.circular(0),
      ),
      width: 400,
      height: 300,
    );
  }
}
