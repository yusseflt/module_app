import 'package:flutter/material.dart';

class LoaderImage extends StatelessWidget {
  final String imageUrl;
  final double? scale;
  final double? height;
  final double? width;

  const LoaderImage(
    this.imageUrl, {
    Key? key,
    this.scale,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      scale: scale ?? 1,
      errorBuilder: (context, obj, trace) => Center(
        child: Icon(Icons.close),
      ),
      loadingBuilder: (context, child, loader) {
        if (loader == null) {
          return Center(child: child);
        }
        return Center(
          child: CircularProgressIndicator(
            value: loader.expectedTotalBytes != null
                ? loader.cumulativeBytesLoaded / loader.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
