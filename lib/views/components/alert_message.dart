import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final Icon icon;
  final String title;
  final String message;
  final String actionButtonTitle;
  final void Function() onTapActionButton;
  const AlertMessage({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.actionButtonTitle,
    required this.onTapActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title)),
        ],
      ),
      title: Text(message),
      actions: [
        ElevatedButton(
            onPressed: onTapActionButton,
            child: Text(actionButtonTitle)),
      ],
    );
  }
}
