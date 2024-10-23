import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    // setState 선언 시 state 값 변경 시 UI 즉시 반영, 밖에서는 UI 즉시 반영 X
    // setState 선언 이후 setState 밖에서 값을 변경해도 즉시 반영되긴 한다(...?)
    // counter = counter + 1;
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click Count',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
            IconButton(
              onPressed: () => onClicked(),
              icon: const Icon(Icons.add_box_rounded),
            )
          ],
        )),
      ),
    );
  }
}
