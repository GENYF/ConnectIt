import 'package:flutter/material.dart';

import '../utils/design.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required String dialogTitle,
    required Widget dialogContent,
    required String buttonLabel,
    required Function buttonOnPressed,
    super.key,
  }) :  _dialogTitle = dialogTitle,
        _dialogContent = dialogContent,
        _buttonLabel = buttonLabel,
        _buttonOnPressed = buttonOnPressed;

  final String _dialogTitle;
  final Widget _dialogContent;
  final String _buttonLabel;
  final Function _buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          _dialogTitle,
          style: DesignerTextStyle.header1,
        ),
      ),
      content: _dialogContent,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '취소',
            style: DesignerTextStyle.title2.apply(color: Colors.black54),
          ),
        ),
        TextButton(
          onPressed: () => _buttonOnPressed(),
          child: Text(
            _buttonLabel,
            style: DesignerTextStyle.title2.apply(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}