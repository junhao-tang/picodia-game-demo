import 'package:flutter/material.dart';
import 'package:picodia/screens/generator.dart';
import 'package:picodia/screens/guesser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: Home()),
    );
  }
}

enum Page {
  guesser,
  home,
  generator,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Page _page = Page.home;

  @override
  Widget build(BuildContext context) {
    switch (_page) {
      case Page.home:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                onPressed: () => setState(() => _page = Page.generator),
                child: const Text("generator")),
            TextButton(
                onPressed: () => setState(() => _page = Page.guesser),
                child: const Text("guesser")),
          ],
        );
      case Page.guesser:
        return Stack(
          children: [
            const GuesserScreen(),
            TextButton(
              onPressed: () => setState(() => _page = Page.home),
              child: const Text("home"),
            ),
          ],
        );
      case Page.generator:
        return Stack(
          children: [
            const GeneratorScreen(),
            TextButton(
              onPressed: () => setState(() => _page = Page.home),
              child: const Text("home"),
            ),
          ],
        );
    }
  }
}
