import 'package:flutter/material.dart';

class CustomTextFieldDialog extends StatelessWidget {
  const CustomTextFieldDialog({
    Key? key,
    required this.title,
    required this.textTrueButton,
    required this.content,
    required this.okHandler,
    this.textFalseButton,
  }) : super(key: key);

  final String title;
  final String textTrueButton;
  final String? textFalseButton;
  final Widget content;
  final void Function() okHandler;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        if (textFalseButton != null)
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(textFalseButton!),
          ),
        TextButton(
          onPressed: okHandler,
          child: Text(textTrueButton),
        )
      ],
    );
  }
}
