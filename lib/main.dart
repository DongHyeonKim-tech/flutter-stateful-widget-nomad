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
  int count = 0;
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  // 상태 초기화 method
  // build method보다 먼저 선언되어야
  @override
  void initState() {
    super.initState();
    print('initState!');
    count = 0;
  }

  // widget tree를 return하는 method(widget이 화면에서 제거될 때 호출)
  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  void onPressed() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const MyLargeTitle() : const Text('nothing'),
            Text(
              '$count',
              style: const TextStyle(fontSize: 15),
            ),
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.plus_one_rounded)),
            IconButton(
                onPressed: toggleTitle, icon: const Icon(Icons.refresh_rounded))
          ],
        )),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
