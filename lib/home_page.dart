import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  String channel = 'DIALOG';
  String channelMethod = 'SHOWDIALOG';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String message;
                  if (_controller.text.isEmpty) {
                    message = 'Please add a dialog message';
                  } else {
                    message = _controller.text;
                  }
                  MethodChannel(channel)
                      .invokeMethod(channelMethod, message);
                },
                child: const Text('Show Dialog'))
          ],
        ),
      ),
    );
  }
}
