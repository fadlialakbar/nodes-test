// ignore_for_file: unnecessary_null_comparison
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:eye_diagnose/test/9arah/detail_picture.dart';
import 'package:eye_diagnose/test/9arah/response_grid.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<XFile>? _takenPhotos;
  int _photoCount = 0;
  int _photoIndex = 1;
  bool _isFlashOn = false;
  bool _isTakingPhoto = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeCamera();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void takePhoto() async {
    if (_cameraController!.value.isInitialized) {
      setState(() {
        _isTakingPhoto = true;
      });

      final photo = await _cameraController!.takePicture();
      final file = File(photo.path);

      // Spawn a new isolate for image processing
      processImage(file);

      setState(() {
        XFile xFile = XFile(photo.path);
        _takenPhotos ??= [];
        _takenPhotos!.add(xFile);
        _photoCount++;
        _photoIndex++;
        _isTakingPhoto = false; // Reset the flag after the photo is taken
      });
    }
  }

  void processImage(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    Uint8List imageBytesUint8 = Uint8List.fromList(imageBytes);
    img.Image? originalImage = img.decodeImage(imageBytesUint8);
    img.Image fixedImage = img.flipHorizontal(originalImage!);

    file.writeAsBytesSync(
      img.encodeJpg(fixedImage),
      flush: true,
    );
  }

  void takePhotoMburi() async {
    if (_cameraController!.value.isInitialized) {
      final photo = await _cameraController!.takePicture();
      setState(() {
        _isTakingPhoto = true;
      });
      setState(() {
        _takenPhotos ??= [];
        _takenPhotos!.add(photo);
        _photoCount++;
        _photoIndex++;
        _isTakingPhoto = false;
      });
    }
  }

  void retakePhoto() {
    setState(() {
      if (_photoCount > 0) {
        _takenPhotos!.removeLast();
        _photoCount--;
        _photoIndex--;
      }
    });
  }

  IconData getIconForIndex(int index) {
    switch (index) {
      case 1:
        return Icons.north_west;
      case 2:
        return Icons.arrow_upward;
      case 3:
        return Icons.north_east;
      case 4:
        return Icons.west;
      case 5:
        return Icons.zoom_in_map;
      case 6:
        return Icons.east;
      case 7:
        return Icons.south_west;
      case 8:
        return Icons.south;
      case 9:
        return Icons.south_east;
      default:
        return Icons.check;
    }
  }

  String getInstructionText() {
    switch (_photoIndex) {
      case 1:
        return "Pasien melihat ke atas bagian kiri";
      case 2:
        return "Pasien melihat ke atas bagian tengah";
      case 3:
        return "Pasien melihat ke atas bagian kanan";
      case 4:
        return "Pasien melihat ke bagian kiri";
      case 5:
        return "Pasien melihat ke bagian tengah-tengah layar";
      case 6:
        return "Pasien melihat ke bagian kanan";
      case 7:
        return "Pasien melihat ke bawah bagian kiri";
      case 8:
        return "Pasien melihat ke bawah bagian tengah";
      case 9:
        return "Pasien melihat ke bawah bagian kanan";
      default:
        return "";
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController!.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCamera();
      _initializeCameraController(_cameraController!.description);
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    if (frontCamera == null) {
      print('Front camera not found');
      return;
    }

    if (_cameraController != null && _cameraController!.value.isInitialized) {
      _cameraController!.dispose();
    }

    setState(() {
      _cameraController = CameraController(frontCamera, ResolutionPreset.max);
    });

    try {
      await _cameraController!.initialize();
    } catch (error) {
      print('Failed to initialize camera: $error');
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
    setState(() {
      _cameraController =
          CameraController(cameraDescription, ResolutionPreset.max);
    });

    try {
      await _cameraController!.initialize();
    } catch (error) {
      print('Failed to initialize camera: $error');
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _toggleCameraLens() async {
    final cameras = await availableCameras();
    final lensDirection = _cameraController!.description.lensDirection;

    final newLensDirection = lensDirection == CameraLensDirection.front
        ? cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.back)
        : cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);

    if (newLensDirection == null) {
      print('Front camera not found');
      return;
    }

    if (_cameraController != null && _cameraController!.value.isInitialized) {
      await _cameraController!.dispose();
    }
    setState(() {
      _cameraController =
          CameraController(newLensDirection, ResolutionPreset.max);
    });

    try {
      await _cameraController!.initialize();
    } catch (error) {
      print('Failed to initialize camera: $error');
    }
    if (mounted) {
      setState(() {});
    }
  }

  void toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
      _cameraController!
          .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController != null) {
      if (!_cameraController!.value.isInitialized) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (_cameraController!.value.isInitialized) {
        final isFrontCamera = _cameraController!.description.lensDirection ==
            CameraLensDirection.front;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Camera'),
          ),
          body: Column(
            children: [
              if (_cameraController!.value.isInitialized)
                Stack(
                  children: [
                    Center(
                        key: widget.key,
                        child: ClipRRect(
                          child: SizedOverflowBox(
                            size: Size(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context)
                                    .size
                                    .width), // aspect is 1:1
                            alignment: Alignment.center,
                            child: CameraPreview(_cameraController!),
                          ),
                        )),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          "assets/face.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (_isTakingPhoto)
                      const Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child:
                                CircularProgressIndicator(), // Show a loading indicator
                          ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _toggleCameraLens();
                    },
                    child: const Icon(Icons.flip_camera_ios_outlined),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          getIconForIndex(_photoIndex),
                          size: 35,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: toggleFlash,
                    child: Icon(
                      _isFlashOn ? Icons.flash_on : Icons.flash_off,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_photoCount < 9)
                Text(
                  getInstructionText(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              if (_photoCount < 9) const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_photoCount < 9)
                    ElevatedButton(
                      onPressed: () {
                        if (_photoCount < 9) {
                          if (isFrontCamera == true) {
                            takePhoto();
                          } else {
                            takePhotoMburi();
                          }
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Anda sudah mengambil 9 gambar!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        'Ambil Foto',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  if (_photoCount >= 9)
                    ElevatedButton(
                      onPressed: () {
                        _cameraController!.dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GridScreen(
                              photos: _takenPhotos!
                                  .map((xfile) => File(xfile.path))
                                  .toList(),
                            ),
                          ),
                        ).then((value) {
                          if (mounted) {
                            initializeCamera();
                          }
                        });
                      },
                      child: const Text(
                        'Tahap Selanjutnya',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: retakePhoto,
                    child: const Icon(Icons.undo_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_takenPhotos != null)
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: _takenPhotos!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDetailScreen(
                                imageFileString: _takenPhotos![index].path,
                              ),
                            ),
                          );
                        },
                        child: Image.file(
                          File(_takenPhotos![index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      }
    }

    return Container();
  }
}
