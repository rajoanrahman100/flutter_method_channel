import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ///Declaring the method channel variable.
  var methodPlatform = const MethodChannel('my.channel.dialog');


  Future<void> callChannelDialog() async {
    try {
      await methodPlatform.invokeMethod('callDialog'); //This "callDialog" message will be received Java/Kotlin for Android or Objective-C/Swift for iOS
    } on PlatformException catch (e) {
      debugPrint("Failed call: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Method Channel",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          onPressed: () {
            callChannelDialog();
          },
          child: const Text(
            "Call Method Channel",
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
