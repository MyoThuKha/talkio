import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePicker extends StatefulWidget {
  static const route = "/image_picker";
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  // void requestPermission() async {
  //   final PermissionState ps = await PhotoManager
  //       .requestPermissionExtend(); // the method can use optional param `permission`.
  //   if (ps.isAuth) {
  //     print("granted full access");
  //     final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
  //   } else if (ps.hasAccess) {
  //     print("granted access");

  //     // Access will continue, but the amount visible depends on the user's selection.
  //   } else {
  //     print("no");
  //     // Limited(iOS) or Rejected, use `==` for more precise judgements.
  //     // You can call `PhotoManager.openSetting()` to open settings for further steps.
  //   }
  // }

  bool isLoading = true;

  void getAllImage() async {
    final List<AssetEntity> entities =
        await PhotoManager.getAssetListPaged(page: 0, pageCount: 80);

    // setState(() {
    //   assets = entities;
    // });
    for (int i = 0; i < entities.length; i++) {
      final imageData = await entities[i].thumbnailData;
      if (imageData != null) {
        assets.add(imageData);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  List<Uint8List> assets = [];
  @override
  void initState() {
    getAllImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: assets.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(1),
                          child: Image.memory(
                            assets[index],
                            width: 500,
                            height: 600,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
