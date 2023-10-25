import 'package:flutter/material.dart';

import '../utils/design.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required Function onPressed,
    required String label,
    super.key,
  }) :  _onPressed = onPressed,
        _label = label;

  final Function _onPressed;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Center(
          child: Text(
            _label,
            style: DesignerTextStyle.header3.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}