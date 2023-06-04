import 'package:flutter/material.dart';

class RefleksPupil extends StatefulWidget {
  const RefleksPupil({super.key});

  @override
  State<RefleksPupil> createState() => _RefleksPupilState();
}

class _RefleksPupilState extends State<RefleksPupil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refleks Pupil'),
      ),
      body: Center(
        child: Image.asset('assets/pupil.jpg'),
      ),
    );
  }
}
