import 'package:flutter/material.dart';

PreferredSizeWidget? topBar(String title) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 56.0),
    child: AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(letterSpacing: 1.0, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
