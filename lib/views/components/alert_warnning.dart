import 'package:flutter/material.dart';

class AlertWarnning extends StatelessWidget { 
  final void Function()? onTapYes; 
  final void Function()? onTapNo; 
  final String title ; 
  final String message; 
  final String? titleYes; 
  final String? titleNo; 
  const AlertWarnning({super.key,
    required this.onTapYes,
    required this.onTapNo,
    required this.title, 
    required this.message, 
    this.titleYes, 
    this.titleNo, 
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        children: [
          const Icon(Icons.warning, color: Colors.yellow),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child:  Text(title)),
        ],
      ),
      title: Text(message),
      actions: [
        ElevatedButton(
            onPressed: onTapYes,
            child: Text((titleYes??'Yes'))),
        ElevatedButton(
            onPressed: onTapNo,
            child: Text(titleNo??'No')),
      ],
    );
  }
}
