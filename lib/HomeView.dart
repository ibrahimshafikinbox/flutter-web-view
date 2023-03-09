import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late InAppWebViewController webView;
  double _progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.faidigold-sa.com/"),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (controller, url) {},
            // onProgressChanged(InAppWebViewController controller, int progress){} ,
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(
                () {
                  _progress = progress / 100;
                },
              );
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 5,
                  child: LinearProgressIndicator(value: _progress),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
