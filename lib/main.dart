import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 250,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () => window.parent?.postMessage(
                    jsonEncode({"type": "pageHeight", "pageHeight": 2100}),
                    '*'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: const SizedBox(
                      height: 20,
                      width: 100,
                      child: Text("Hello"),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
