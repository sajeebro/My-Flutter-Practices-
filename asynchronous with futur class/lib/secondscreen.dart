import 'package:flutter/material.dart';

class MySecond extends StatefulWidget {
  const MySecond({super.key});

  @override
  State<MySecond> createState() => _MySecondState();
}

class _MySecondState extends State<MySecond> {
  @override
  void initState() {
    asycData();
    syncData();
    getrequest();
    super.initState();
  }

  void asycData() {
    Future.delayed(const Duration(seconds: 3), (() {
      print('emial received');
    }));
    print("worked");
  }

  Future<String> syncData() async {
    String email = await Future.delayed(const Duration(seconds: 5), (() {
      return "Email";
    }));
    String username = await Future.delayed(const Duration(seconds: 5), (() {
      return "username";
    }));
    return email;
  }

  Future<void> getrequest() async {
    print(await syncData());
  }

  /// future class have to state 1) uncompeted 2) competed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("async app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Get Data"),
          ],
        ),
      ),
    );
  }
}
