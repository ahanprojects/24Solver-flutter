import 'package:flutter/material.dart';

class Bgtext extends StatelessWidget {
  final String text;
  final String path;
  final double? height;
  final double? width;
  final double? fontSize;

  const Bgtext(
      {Key? key,
      required this.text,
      required this.path,
      this.height,
      this.width,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'Caveman',
                  fontSize: fontSize,
                  color: Color(0xff554C4B)))),
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
    );
  }
}
