// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'cm_container.dart';
import 'package:get/get.dart';

class CmExtendedImage extends StatelessWidget {
  final String url;

  const CmExtendedImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              CmContainer(
                width: Get.width,
                borderColor: Colors.grey,
                borderWidthBottom: 1,
                paddingStart: 10,
                paddingTop: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              CmContainer(
                  child: ExtendedImage.network(
                url,
                width: Get.width,
                height: Get.height * 0.85,
                fit: BoxFit.contain,
                cache: true,
                mode: ExtendedImageMode.gesture,
                initGestureConfigHandler: (state) {
                  return GestureConfig(
                    minScale: 0.9,
                    animationMinScale: 0.7,
                    maxScale: 3.0,
                    animationMaxScale: 3.5,
                    speed: 1.0,
                    inertialSpeed: 100.0,
                    initialScale: 1.0,
                    inPageView: false,
                    initialAlignment: InitialAlignment.center,
                  );
                },
                //cancelToken: cancellationToken,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
