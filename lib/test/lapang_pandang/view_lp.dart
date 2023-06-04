import 'package:flutter/material.dart';

class LapangPandang extends StatefulWidget {
  const LapangPandang({super.key});

  @override
  State<LapangPandang> createState() => _LapangPandangState();
}

class _LapangPandangState extends State<LapangPandang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapang Pandang'),
      ),
      body: Center(
        child: Image.asset('assets/lp1.png'),
      ),
    );
  }
}
