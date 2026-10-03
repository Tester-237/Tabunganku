import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF0F172A),
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const NabungkuApp());
}

class NabungkuApp extends StatelessWidget {
  const NabungkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nabungku',
      home: NabungkuPage(),
    );
  }
}

class NabungkuPage extends StatefulWidget {
  const NabungkuPage({super.key});

  @override
  State<NabungkuPage> createState() => _NabungkuPageState();
}

class _NabungkuPageState extends State<NabungkuPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF0F172A))
      ..loadFlutterAsset('assets/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
