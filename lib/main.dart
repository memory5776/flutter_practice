import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_loading_images/models/image_gallery_model.dart';

import 'image_gallery_page.dart';

Future<void> main() async {

  await Hive.initFlutter();
  Hive.registerAdapter<ImageGalleryModel>(ImageGalleryModelAdapter());
  await Hive.openBox<ImageGalleryModel>('ImageGalleryModel');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Loading Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Image Gallery Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'JSON Placeholder',
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push (
                  MaterialPageRoute (
                    builder: (BuildContext context) => const ImageGalleryPage(),
                  ),
                );
              },
              child: const Text('Request API'),)
          ],
        ),
      ),
    );
  }
}
