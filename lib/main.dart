// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:twentyfoursolver_flutter/bgtext.dart';
import 'package:twentyfoursolver_flutter/bgtextfield.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("assets/mockup.png"),
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3), BlendMode.modulate))),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 105),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                // Judul dan help
                children: [
                  Expanded(
                    child: Center(
                      child: Bgtext(
                          text: "24 Solver",
                          path: "assets/space.png",
                          width: 280,
                          height: 83),
                    ),
                  ),
                  Bgtext(
                    text: "?",
                    path: "assets/bulet.png",
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                // Input dan board
                children: [
                  SizedBox(width: 33),
                  Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          BgTextfield(),
                          SizedBox(width: 15),
                          BgTextfield(),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          BgTextfield(),
                          SizedBox(width: 15),
                          BgTextfield(),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Bgtext(
                              text: "X",
                              path: "assets/bulet.png",
                              width: 50,
                              height: 50),
                          SizedBox(width: 20),
                          Bgtext(
                              text: "Solve",
                              path: "assets/spaceround.png",
                              width: 220,
                              height: 50),
                        ],
                      )
                    ],
                  ),
                  Column(
                    // Hasil
                    children: [],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
