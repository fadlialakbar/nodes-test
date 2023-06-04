import 'package:flutter/material.dart';

class PtosisView extends StatefulWidget {
  const PtosisView({super.key});

  @override
  State<PtosisView> createState() => _PtosisViewState();
}

class _PtosisViewState extends State<PtosisView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ptosis Test'),
      ),
      body: Center(
        child: Image.asset('assets/ptosis.jpg'),
      ),
    );
  }
}
