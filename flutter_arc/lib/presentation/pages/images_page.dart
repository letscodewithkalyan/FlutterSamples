import 'package:flutter/material.dart';
import 'package:flutter_arc/presentation/providers/address_provider.dart';
import 'package:flutter_arc/presentation/widgets/image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesPage extends ConsumerWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesAsync = ref.watch(imagesProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Images")),
      body: Stack(
        children: [
          imagesAsync.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  ImageCard(imageModel: data[index]),
            ),
            loading: () => Text("Loading"),
            error: (error, stackTrace) => Text("Error"),
          ),
        ],
      ),
    );
  }
}
