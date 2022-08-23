// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Youtube extends StatefulWidget {
  const Youtube({Key? key, required this.url}) : super(key: key);
  @override
  State<Youtube> createState() => _YoutubeState();
  final String url;
}

class _YoutubeState extends State<Youtube> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        url: widget.url,
        // appBar: AppBar(title: Text('CodeChef'),backgroundColor: Colors.green,),
        displayZoomControls: true,
        withZoom: true,
        useWideViewPort: true,
      ),
    );
  }
}
