import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/apis/api_response.dart';
import 'package:flutter_mvvm/models/apis/media.dart';
import 'package:flutter_mvvm/view_models/media_viewmodel.dart';
import 'package:flutter_mvvm/views/player_list_widget.dart';
import 'package:flutter_mvvm/views/widgets/player_widget.dart';
import 'package:provider/provider.dart';

class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  Widget getMediaWidget(BuildContext context, ApiResponse apiResponse) {
    List<Media>? mediaList = apiResponse.data as List<Media>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: PlayerListWidget(mediaList!, (Media media) {
              Provider.of<MediaViewModel>(context, listen: false)
                  .setSelectedMedia(media);
            })),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PlayerWidget(function: () {}),
                ))
          ],
        );
      case Status.ERROR:
        return const Center(
          child: Text('Please try again letter'),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text("Search the song by artist"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
