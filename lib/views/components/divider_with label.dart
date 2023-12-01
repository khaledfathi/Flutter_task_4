import 'package:flutter/material.dart';

class DividerWithLabel extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final int? textFlex;
  final int? leftFlex;
  final int? rightFlex;
  final Color? backgroundColor;
  final EdgeInsets? margin;

  const DividerWithLabel(
      {super.key,
      required this.text,
      this.height,
      this.width,
      this.backgroundColor,
      this.textFlex = 1,
      this.leftFlex = 2,
      this.rightFlex = 2,
      this.margin ,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      margin:  margin,
      child: Row(
        children: [
          Expanded(
            flex: leftFlex!,
            child: const Divider(
              color: Colors.black,
              thickness: 1,
              height: 1,
            ),
          ),
          Expanded(
            flex: textFlex!,
            child: Center(child: Text(text)),
          ),
          Expanded(
            flex: rightFlex!,
            child: const Divider(
              color: Colors.black,
              thickness: 1,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
