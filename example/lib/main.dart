import 'package:flutter/material.dart';
import 'package:widevine_id/widevine_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<String>(
              future: WidevineId().id(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Widevine Id: \n',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextSpan(
                          text: snapshot.requireData,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                return const SizedBox.shrink();
              }),
        ),
      ),
    );
  }
}
