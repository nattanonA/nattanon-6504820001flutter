import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  Widget? cameraPreview;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    camera = cameras!.first;
    _controller = CameraController(camera!, ResolutionPreset.medium);
    await _controller!.initialize();
    cameraPreview = Center(child: CameraPreview(_controller!));
    setState(() {
      cameraPreview = cameraPreview;
    });
  }
  @override
  void initState() {
    super.initState();
    initCamera();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    print('Dispose here');
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera'), actions: [
          IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () async {
                final image = await _controller!.takePicture();
                print(image.path);
                Navigator.pushNamed(context, 'homestack/picture',
                    arguments: {'path': image.path});
              })
        ]),
      body: Center(
        child: cameraPreview
      ),
    );
  }
}