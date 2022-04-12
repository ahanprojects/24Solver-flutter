// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:twentyfoursolver_flutter/algorithm.dart';
import 'package:twentyfoursolver_flutter/bgtext.dart';
import 'package:twentyfoursolver_flutter/bgtextfield.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _HomePageState();
}

class _HomePageState extends State<MobileBody> {
  final controller = PageController(initialPage: 0);
  final input1 = TextEditingController();
  final input2 = TextEditingController();
  final input3 = TextEditingController();
  final input4 = TextEditingController();
  int totalSolution = dummySolution().length;

  int num1 = -1;
  int num2 = -1;
  int num3 = -1;
  int num4 = -1;

  String solutionFound = 'Solutions';
  String pageNumber = '';
  int currentPage = 1;
  int itemCount = 8;
  late int totalPage = (totalSolution / itemCount).ceil();
  @override
  void dispose() {
    controller.dispose();
    input1.dispose();
    input2.dispose();
    input3.dispose();
    input4.dispose();
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
        ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    // Judul dan help
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 75),
                      Expanded(
                        child: Center(
                          child: Bgtext(
                              text: "24 Solver",
                              path: "assets/space.png",
                              width: 280,
                              height: 83),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: ListView(
                                      children: [
                                        Container(
                                          // height: 600,
                                          // width: 700,
                                          padding: EdgeInsets.all(35),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/papan.png"))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(25),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      "24 Solver - Ahan Projects",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff554C4B),
                                                          fontFamily: "Caveman",
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    "The 24 puzzle is an arithmetic puzzle in which the goal is to manipulate four integers to get the number 24 as the final result. Addition, subtraction, multiplication, and division are the four mathematical operators available.",
                                                    style: TextStyle(
                                                        fontFamily: "Patrick",
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff554C4B),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      "How to use 24 solver: input 4 integers between 0 and 99, click the solve button. To clear all text fields and solutions, click the X button.",
                                                      style: TextStyle(
                                                          fontFamily: "Patrick",
                                                          color:
                                                              Color(0xff554C4B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      "The program is using Brute-Force Algorithm to calculate all possible solutions to the inputs given.",
                                                      style: TextStyle(
                                                          fontFamily: "Patrick",
                                                          color:
                                                              Color(0xff554C4B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(height: 30),
                                                  Text(
                                                      "This website is created using Flutter, algorithm is implemented using Python.",
                                                      style: TextStyle(
                                                          fontFamily: "Patrick",
                                                          color:
                                                              Color(0xff554C4B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  InkWell(
                                                    onTap: () => _launchURL(),
                                                    child: Text(
                                                        "Click here to see the algorithm!",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Patrick",
                                                            color: Colors.blue,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Text(
                                                      "Assets credits: Shutterstock, Pinterest.",
                                                      style: TextStyle(
                                                        fontFamily: "Patrick",
                                                        color:
                                                            Color(0xff554C4B),
                                                        fontSize: 15,
                                                      ))
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ));
                              });
                        },
                        child: Bgtext(
                          text: "?",
                          path: "assets/bulet.png",
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Column(
                    // Input dan board
                    children: [
                      Column(
                        children: [
                          // SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BgTextfield(controller: input1),
                              SizedBox(width: 15),
                              BgTextfield(controller: input2),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BgTextfield(controller: input3),
                              SizedBox(width: 15),
                              BgTextfield(controller: input4),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  input1.clear();
                                  input2.clear();
                                  input3.clear();
                                  input4.clear();
                                  setState(() {
                                    num1 = -1;
                                    num2 = -1;
                                    num3 = -1;
                                    num4 = -1;

                                    pageNumber = '';
                                    solutionFound = "Solutions";
                                  });
                                },
                                child: Bgtext(
                                    text: "X",
                                    path: "assets/bulet.png",
                                    width: 50,
                                    height: 50),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  if (input1.text.isEmpty ||
                                      input2.text.isEmpty ||
                                      input3.text.isEmpty ||
                                      input4.text.isEmpty) {
                                    return;
                                  }
                                  setState(() {
                                    num1 = int.parse(input1.text);
                                    num2 = int.parse(input2.text);
                                    num3 = int.parse(input3.text);
                                    num4 = int.parse(input4.text);

                                    pageNumber = currentPage.toString() +
                                        "/" +
                                        totalPage.toString();

                                    solutionFound = (totalSolution).toString() +
                                        " solutions found";
                                  });
                                },
                                child: Bgtext(
                                    text: "Solve",
                                    path: "assets/spaceround.png",
                                    width: 220,
                                    height: 50),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 500,
                        width: 600,
                        padding: EdgeInsets.all(35),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/papan.png"))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(solutionFound,
                                      style: TextStyle(
                                          fontFamily: "Caveman",
                                          fontSize: 6,
                                          color: Color(0xff554C4B))),
                                  // Tombol
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (currentPage > 1) {
                                            setState(() {
                                              controller.previousPage(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.easeOut);
                                              currentPage -= 1;
                                              pageNumber =
                                                  currentPage.toString() +
                                                      "/" +
                                                      totalPage.toString();
                                            });
                                          }
                                        },
                                        child: Text("< ",
                                            style: TextStyle(
                                                fontFamily: "Caveman",
                                                fontSize: 10)),
                                      ),
                                      Text(
                                        pageNumber,
                                        style: TextStyle(
                                            fontFamily: "Caveman",
                                            fontSize: 6,
                                            color: Color(0xff554C4B)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (input1.text.isEmpty ||
                                              input2.text.isEmpty ||
                                              input3.text.isEmpty ||
                                              input4.text.isEmpty) {
                                            return;
                                          }
                                          if (currentPage < totalPage) {
                                            setState(() {
                                              controller.nextPage(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.easeOut);
                                              currentPage += 1;
                                              pageNumber =
                                                  currentPage.toString() +
                                                      "/" +
                                                      totalPage.toString();
                                            });
                                          }
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
                              child: buildPageView(context, controller,
                                  itemCount, num1, num2, num3, num4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ],
              ),
            ),
          ],
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

  Widget buildPageView(BuildContext context, PageController controller,
      int itemCount, int input1, int input2, int input3, int input4) {
    if (input1 + input2 + input3 + input4 < 0) return Container();
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
    for (var item in chunks) {
      print(item);
    }
    print(chunks.length);
    // return column dgn isi list berbeda
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      itemBuilder: (context, index) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: chunks[index]);
      },
      itemCount: chunks.length,
    );
  }

  void _launchURL() async {
    var _url = 'https://github.com/ahanprojects/24Solver';
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
