import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _controller;
  @override
  void initState() {
    super.initState();
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          break;
        case InternetConnectionStatus.disconnected:
          Navigator.pushNamed(context, 'no_internet');

          break;
      }
    });
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
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
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  Future<bool> onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: containerTextColor,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            ontap: () {
              Navigator.popAndPushNamed(context, 'home_page');
            },
            title: "Offer",
            widgetOne: Image.asset(
              arrowBack,
              height: 16,
            ),
          ),
        ),
        body: SafeArea(
          child: WebViewWidget(
            controller: _controller!,
          ),
        ),
      ),
    );
  }
}
