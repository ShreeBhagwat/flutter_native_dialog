import 'package:flutter/material.dart';
import 'package:flutter_native_dialog/home_page.dart';

void main() {
  runApp(FlutterNativeDialog());
}

class FlutterNativeDialog extends StatelessWidget {
  const FlutterNativeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
