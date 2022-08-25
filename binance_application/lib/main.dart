//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyStatefulWidget(title: 'Binance application'),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  // ignore: non_constant_identifier_names
  int _PageSelectorIndex = 0; //selector of page changed by bottom toolbar

  // ignore: prefer_final_fields, non_constant_identifier_names
  static List<Widget> _Pages = <Widget>[
    Scaffold(
        body: Center(
          child: Row(
            children: [Text("prova"), Text("|aaaa")],
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: _onButtonPressed,
          child: Text("prova"),
        )),
    const Text("Page 1"),
    const Text("Page 2")
  ];

  static void _onButtonPressed() {}

  void _onItemTapped(int index) {
    setState(() {
      _PageSelectorIndex = index;
    });
  }

  //build method attached at the end of initialization
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _Pages.elementAt(_PageSelectorIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Page 0",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Page 1",
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Page 2",
              backgroundColor: Colors.green)
        ],
        currentIndex: _PageSelectorIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
      ),
    );
  }
}
