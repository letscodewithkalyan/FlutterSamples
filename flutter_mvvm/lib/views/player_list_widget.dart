import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/apis/media.dart';

class PlayerListWidget extends StatefulWidget {
  final List<Media> _mediaList;
  final Function _function;
  const PlayerListWidget(this._mediaList, this._function);

  @override
  State<PlayerListWidget> createState() => _PlayerListWidgetState();
}

class _PlayerListWidgetState extends State<PlayerListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
