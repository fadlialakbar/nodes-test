import 'dart:io';

import 'package:flutter/material.dart';

class ImageDetailScreen extends StatefulWidget {
  final String imageFileString;

  const ImageDetailScreen({super.key, required this.imageFileString});

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: Center(
        child: Image.file(File(widget.imageFileString)),
      ),
    );
  }
}
