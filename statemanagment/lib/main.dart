import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("1");
    return ChangeNotifierProvider(
      // use provider class
      create: (context) => MyData(), // model class for create:
      builder: (BuildContext context, child) => Scaffold(
        appBar: AppBar(title: Consumer<MyData>(
          // use consumer because stop to rebuild widgets
          builder: (context, value, child) {
            return Text(value.name);
          },
        )),
        body: const Seceen2(),
      ),
    );
  }
}

class Seceen2 extends StatelessWidget {
  const Seceen2({super.key});

  @override
  Widget build(BuildContext context) {
    print("2");
    return const Screen3();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    print("3");
    return const Screen4();
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    print("4");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MyData>(
            // use consumer because stop to rebuild widgets
            // Text(Provider.of<MyData>(context).name),
            builder: (context, value, child) {
              return Text(value.name);
            },
          ),
          ElevatedButton(
              onPressed: () {
                // Provider.of<MyData>(context, listen: false).changeName("Mashi babi"); this also ok but short methode is better
                context.read<MyData>().changeName(
                    Random().nextInt(100).toString()); // callback function
              },
              child: const Text("click"))
        ],
      ),
    );
  }
}

// model class for stateManage
class MyData extends ChangeNotifier {
  String _name = "mash";
  void changeName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;
}
// when we use this provider state-manager package then we can chanege widgets what we want. wihtout rebulid all widgets
// usefull for high performence app 