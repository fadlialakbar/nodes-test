import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VisualAcuityTest extends StatefulWidget {
  @override
  _VisualAcuityTestState createState() => _VisualAcuityTestState();
}

class _VisualAcuityTestState extends State<VisualAcuityTest> {
  List<String> imagePaths = [
    'assets/visual 1.png',
    'assets/visual 2.png',
    'assets/visual 3.png',
    'assets/visual 4.png',
    'assets/visual 5.png',
    'assets/visual 6.png',
    'assets/visual 7.png',
    'assets/visual 8.png',
    'assets/visual 9.png',
  ];
  int currentImageIndex = 0;

  void nextImage() {
    setState(() {
      if (currentImageIndex < imagePaths.length - 1) {
        currentImageIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tes Selesai'),
              content: Text('Anda telah menyelesaikan tes Visual Acuity.'),
              actions: [
                ElevatedButton(
                  child: Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tes Visual Acuity'),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swipe ke kanan, ganti ke gambar sebelumnya jika tersedia.
            setState(() {
              if (currentImageIndex > 0) {
                currentImageIndex--;
              }
            });
          } else if (details.primaryVelocity! < 0) {
            // Swipe ke kiri, ganti ke gambar berikutnya jika tersedia.
            setState(() {
              if (currentImageIndex < imagePaths.length - 1) {
                currentImageIndex++;
              }
            });
          }
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePaths[currentImageIndex],
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  child: Text('Selanjutnya'),
                  onPressed: nextImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
