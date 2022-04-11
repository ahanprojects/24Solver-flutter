// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:twentyfoursolver_flutter/algorithm.dart';
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
  final controller = PageController(initialPage: 0);
  int currentPage = 1;
  int itemCount = 16;
  late int totalPage = (dummySolution().length / itemCount).ceil();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: const AssetImage("assets/cave.png"),
          )),
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
                  SizedBox(width: 50),
                  Container(
                    height: 400,
                    width: 600,
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/papan.png"))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("242 solutions found",
                                  style: TextStyle(
                                      fontFamily: "Caveman",
                                      fontSize: 10,
                                      color: Color(0xff554C4B))),
                              // Tombol
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (currentPage > 1) {
                                        setState(() {
                                          currentPage -= 1;
                                        });
                                      }
                                      controller.previousPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOut);
                                    },
                                    child: Text("< ",
                                        style: TextStyle(
                                            fontFamily: "Caveman",
                                            fontSize: 10)),
                                  ),
                                  Text(
                                    currentPage.toString() +
                                        "/" +
                                        totalPage.toString(),
                                    style: TextStyle(
                                        fontFamily: "Caveman",
                                        fontSize: 10,
                                        color: Color(0xff554C4B)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (currentPage < totalPage) {
                                        setState(() {
                                          currentPage += 1;
                                        });
                                      }
                                      controller.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOut);
                                    },
                                    child: Text(" >",
                                        style: TextStyle(
                                            fontFamily: "Caveman",
                                            fontSize: 10)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: buildPageView(context, controller, 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  List<List<Widget>> splitListToChunks(List<Widget> list, int listItemCount) {
    List<List<Widget>> newList = [];
    int pageCount = (list.length / listItemCount).ceil();

    for (int i = 0; i < pageCount; i++) {
      int chunk = listItemCount;
      if (list.length < listItemCount) {
        chunk = list.length;
      }
      newList.add(list.sublist(0, chunk));
      list.removeRange(0, chunk);
    }

    return newList;
  }

  Widget buildPageView(
      BuildContext context, PageController controller, int itemCount) {
    List<String> list = dummySolution();
    // ubah jadi listitem
    List<Text> listItem = list
        .map((e) => Text(
              e,
              style: TextStyle(fontFamily: "Patrick", fontSize: 26),
            ))
        .toList();
    // Pecah jadi chucks
    List<List<Widget>> chunks = splitListToChunks(listItem, itemCount);
    // return column dgn isi list berbeda
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                children: chunks[index]
                    .sublist(0, (chunks[index].length / 2).ceil())),
            SizedBox(width: 30),
            Column(
                children:
                    chunks[index].sublist((chunks[index].length / 2).ceil())),
          ],
        );
      },
      itemCount: chunks.length,
    );
  }
}
