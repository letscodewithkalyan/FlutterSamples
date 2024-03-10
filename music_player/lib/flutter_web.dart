import 'package:flutter/material.dart';
import 'package:music_player/views/widgets/loading_overlay.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterWeb extends StatefulWidget {
  const FlutterWeb({super.key});

  @override
  State<FlutterWeb> createState() => _FlutterWebState();
}

class _FlutterWebState extends State<FlutterWeb> {
  bool _isShowloader = false;
  void setLoaderState({required bool isShowLoader}) {
    setState(() {
      _isShowloader = isShowLoader;
    });
  }

  final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000));

  @override
  Widget build(BuildContext context) {
    print("Loading");
    return Stack(
      children: [
        CustomWebViewWidget(
          SetLoaderState: (p0) {
            setLoaderState(isShowLoader: p0);
          },
        ),
        if (_isShowloader)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isShowloader)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  void showLoaderDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class CustomWebViewWidget extends StatelessWidget {
  Function(bool) SetLoaderState;
  CustomWebViewWidget({super.key, required this.SetLoaderState});
  final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000));
  @override
  Widget build(BuildContext context) {
    print("Loading");
    return WebViewWidget(
      controller: webViewController
        ..loadRequest(Uri.parse('https://flutter.dev'))
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) => {LoadingOverlay.of(context).show()},
            onPageFinished: (url) => {LoadingOverlay.of(context).hide()},
          ),
        ),
    );
  }
}
