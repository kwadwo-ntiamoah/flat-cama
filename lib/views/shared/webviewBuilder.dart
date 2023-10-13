import 'package:cama_mod/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:developer' as developer;

class WebViewBuilder extends StatefulWidget {
  final String url;

  const WebViewBuilder({super.key, required this.url});

  @override
  State<WebViewBuilder> createState() => _WebViewBuilderState();
}

class _WebViewBuilderState extends State<WebViewBuilder> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            if (progress < 100) {
              setState(() => isLoading = true);
            } else {
              setState(() => isLoading = false);
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
          child: CircularProgressIndicator(color: KColors.kPrimaryColor));
    }
    return WebViewWidget(controller: controller);
  }
}
