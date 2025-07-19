import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/models/image_model.dart';

class ImageCard extends StatelessWidget {
  final ImageModel imageModel;
  const ImageCard({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // CachedNetworkImage(height: 160, imageUrl: imageModel.url ?? ''),
          Text(imageModel.title ?? ""),
          Text(imageModel.description ?? ""),
        ],
      ),
    );
  }
}
