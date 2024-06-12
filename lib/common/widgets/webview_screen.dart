import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//FIX ME: https://github.com/flutter/flutter/issues/43595
class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, required this.link});

  final String link;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController _controller = WebViewController();

  @override
  void initState() {
    _controller.loadRequest(Uri.parse(widget.link));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("加载中..."),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
