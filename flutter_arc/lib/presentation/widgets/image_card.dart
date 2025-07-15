import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc/data/models/image_model.dart';

class ImageCard extends StatelessWidget {
  final ImageModel imageModel;
  const ImageCard({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: imageModel.url ?? "",
              height: 160,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(
            imageModel.title ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 6),
            child: Text(
              imageModel.description ?? "",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
