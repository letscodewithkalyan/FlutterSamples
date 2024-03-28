import 'package:flutter/material.dart';
import 'package:music_player/viewmodels/artist_viewmodel.dart';
import 'package:provider/provider.dart';

class ArtisView extends StatefulWidget {
  const ArtisView({super.key});

  @override
  State<ArtisView> createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtisView> {
  final viewModel = ArtistViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shows")),
      body: Expanded(
        child: ChangeNotifierProvider<ArtistViewModel>(
          create: (context) => viewModel,
          child: Consumer<ArtistViewModel>(
            builder: (context, value, child) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: value.showsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(children: [
                      Image.network(
                        value.showsList[index].mediumImage,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            Container(child: Text(value.showsList[index].name)),
                      )
                    ]),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
