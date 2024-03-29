import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:matabunda/dasbor/dasbor.dart';
import 'package:matabunda/ip/ip.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (cameras == null) {
      return Container();
    }
    return MaterialApp(
      title: 'IP Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print('No cameras available');
      return;
    }
    final camera = cameras.first;
    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      _isCameraInitialized = true;
    });
    _cameraController.setFlashMode(FlashMode.off); // Disable flash mode
    _startStreaming();
  }

  void _startStreaming() async {
    if (_isCameraInitialized) {
      while (true) {
        final image = await _cameraController.takePicture();
        final bytes = await image.readAsBytes();
        _sendFrame(bytes);
      }
    }
  }

  void _sendFrame(List<int> frame) async {
    final url = ip + 'video_feed'; // Ganti dengan alamat server Flask Anda

    try {
      final response = await http.post(
        Uri.parse(url),
        body: frame,
        headers: {
          'Content-Type': 'application/octet-stream',
        },
      );

      print(response.statusCode);
    } catch (error) {
      print('Error sending frame: $error');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    int heigth = 1000;
    int width = 200;
    if (!_isCameraInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Kamera'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 192, 0, 29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => DashboardApp(),
              ),
            );
          },
        ),
      ),
      body: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                width: _cameraController.value.previewSize!.height,
                height: _cameraController.value.previewSize!.width,
                child: CameraPreview(_cameraController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:http/http.dart' as http;
// import 'package:mobile_app/ip/ip.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;

// List<CameraDescription>? cameras;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(CameraApp());
// }

// class CameraApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (cameras == null) {
//       return Container();
//     }
//     return MaterialApp(
//       title: 'IP Camera',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CameraScreen(),
//     );
//   }
// }

// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;
//   bool _isCameraInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   void _initializeCamera() async {
//     cameras = await availableCameras(); // Inisialisasi daftar kamera
//     final camera = cameras!.first;
//     _cameraController = CameraController(camera, ResolutionPreset.medium);
//     await _cameraController.initialize();
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _isCameraInitialized = true;
//     });
//     _startStreaming();
//   }

//   void _startStreaming() {
//     if (_isCameraInitialized) {
//       _cameraController.startImageStream((CameraImage image) {
//         // Konversi CameraImage ke bytes jika diperlukan
//         List<int> bytes = processCameraImage(image);

//         // Kirim frame ke server Flask
//         _sendFrame(bytes);
//       });
//     }
//   }

//   List<int> processCameraImage(CameraImage image) {
//     final width = image.width;
//     final height = image.height;

//     // Menangani plane gambar berdasarkan platform
//     final planes = image.planes;
//     final bytes = planes[0].bytes;

//     // Konversi ke format Image dari paket image
//     final img.Image imgData = img.Image(width, height);
//     imgData.data.setRange(0, bytes.length, bytes);

//     // Konversi ke format JPEG
//     final jpeg = img.encodeJpg(imgData);

//     return jpeg;
//   }

//   void _sendFrame(List<int> frame) async {
//     final url = ip + '/video_feed'; // Ganti dengan alamat server Flask Anda

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: frame,
//         headers: {
//           'Content-Type': 'application/octet-stream',
//         },
//       );

//       print(response.statusCode);
//     } catch (error) {
//       print('Error sending frame: $error');
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     int heigth = 500;
//     int width = 100;
//     if (!_isCameraInitialized) {
//       return Container();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IP Camera'),
//       ),
//       body: FittedBox(
//         fit: BoxFit.cover,
//         child: SizedBox(
//           width: _cameraController.value.previewSize!.height,
//           height: _cameraController.value.previewSize!.width,
//           child: CameraPreview(_cameraController),
//         ),
//       ),
//     );
//   }
// }
