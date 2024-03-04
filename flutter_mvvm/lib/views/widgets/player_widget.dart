import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  final Function function;
  const PlayerWidget({super.key, required this.function});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
