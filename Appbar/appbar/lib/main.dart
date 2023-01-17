import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hide debug banner
      //---------- this for device Perview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      //--------------------------------------

      title: "appbar",

      home: const HomPage(), // home page set
    );
  }
}

// home page class
class HomPage extends StatelessWidget {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // this for Tabbar
      length: 3, // lenth ot tabbar
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('MyApp'),
          actions: const [
            Icon(Icons.search),
          ],
          // flexibleSpace: Image.asset(
          //   "lib/assrst/download.jpg",
          //   fit: BoxFit.cover,
          // ),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(50.0),
          //   child: Container(),
          // ),
          bottom: const TabBar(labelColor: Colors.yellow, tabs: [
            Tab(
              icon: Icon(Icons.bike_scooter),
              text: 'bro',
            ),
            Tab(
              icon: Icon(Icons.ballot),
            ),
            Tab(
              icon: Icon(Icons.bus_alert),
            ),
          ]),
          elevation: 8.0, // dropshadow under the tabbar
          backgroundColor: Colors.pink,
        ),
        //-------- end of Appbar--------------

        body: TabBarView(children: [
          tab1(),
          const Icon(Icons.ballot),
          const Icon(Icons.abc_rounded),
        ]),
      ),
    );
  }
}

// function for tabview1
tab1() {
  return const Center(
    child: Text(
      "hello",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}
