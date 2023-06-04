import 'package:eye_diagnose/components/button_component.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class GridScreen extends StatefulWidget {
  final List<File> photos;

  const GridScreen({Key? key, required this.photos}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  GlobalKey globalKey = GlobalKey();
  late ScreenshotController screenshotController = ScreenshotController();

  Future<void> _saveGridAsImage() async {
    final image = await screenshotController.capture();
    final directory = await getExternalStorageDirectory();
    final imagePath = '${directory?.path}/gaze.png';
    final File imageFile = File(imagePath);
    await imageFile.writeAsBytes(image!);

    final result = await ImageGallerySaver.saveFile(imageFile.path);
    if (result['isSuccess']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gambar berhasil diunduh.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal menyimpan gambar.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Test'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: _saveGridAsImage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RepaintBoundary(
              key: globalKey,
              child: Screenshot(
                controller: screenshotController,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Image.file(
                      widget.photos[index],
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FullWidthFilledButton(
                onPressed: _saveGridAsImage,
                child: const Text(
                  'Donwload',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
