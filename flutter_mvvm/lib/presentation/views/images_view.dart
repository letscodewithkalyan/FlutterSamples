import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/viewmodels/images_viewmodel.dart';
import 'package:flutter_mvvm/presentation/widget/image_card.dart';
import 'package:provider/provider.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({super.key});

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<ImagesViewmodel>(context, listen: false).loadData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ImagesViewmodel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Image")),
      body: Column(
        children: [
          if (vm.isLoading) Center(child: CircularProgressIndicator()),
          if (vm.images != null)
            Expanded(
              child: ReorderableListView(
                children: [
                  for (
                    int position = 0;
                    position < vm.images!.length;
                    position++
                  )
                    ImageCard(
                      key: Key(
                        vm.images![position].title ?? position.toString(),
                      ),
                      imageModel: vm.images![position],
                    ),
                ],
                onReorder: (oldIndex, newIndex) {
                  vm.reorderListView(oldIndex, newIndex);
                },
              ),
            ),
        ],
      ),
    );
  }
}
