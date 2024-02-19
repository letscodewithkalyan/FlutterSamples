import 'package:flutter/material.dart';

class LoadingOverlayWidget extends StatefulWidget {
  final Widget child;
  const LoadingOverlayWidget({super.key, required this.child});

  static _LoadingOverlayWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_LoadingOverlayWidgetState>()!;
  }

  @override
  State<LoadingOverlayWidget> createState() => _LoadingOverlayWidgetState();
}

class _LoadingOverlayWidgetState extends State<LoadingOverlayWidget> {
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
