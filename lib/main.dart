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
  @override
  // context: 모든 상위(부모) 요소들에 대한 정보, 부모 요소 접근 가능
  Widget build(BuildContext context) {
    return MaterialApp(
      // 테마 설정
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyLargeTitle(),
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
          // 부모 요소 접근이 가능한 context를 사용해 부모 요소에서 설정한 theme를 자식 요소에 적용
          fontSize: 30,
          color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
