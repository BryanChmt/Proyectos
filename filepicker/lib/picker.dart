import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultiImage extends StatefulWidget {
  MultiImage({Key? key}) : super(key: key);

  @override
  State<MultiImage> createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  List<Asset> images = [];
  Dio dio = Dio();

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  _saveImage() async {
    if (images != null) {
      for (var i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();

        Future<void> writeToFile(ByteData data, String path) {
          final buffer = data.buffer;
          return new File(path).writeAsBytes(
              buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
        }

        // MultipartFile multipartFile = MultipartFile.fromBytes(
        //   imageData,
        //   filename:  images[i].name,
        // );

        // FormData formData = FormData.fromMap({
        //   "image" : multipartFile
        // });

        print('informacion dada en bytes AAAAAAAAAAAAAAAAAAA $imageData');
        print('informacion dada en bytes BBBBBBBBBBBBBBBBBB $byteData');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              loadAssets();
            },
            child: Text("pick")),
        ElevatedButton(
            onPressed: () {
              _saveImage();
            },
            child: Text("SEND")),
        buildGridView()
      ],
    );
  }
}
