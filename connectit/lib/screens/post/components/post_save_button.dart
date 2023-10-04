import 'package:flutter/material.dart';

import '../../../utils/design.dart';

class PostSaveButton extends StatelessWidget {
  const PostSaveButton({
    required Function onPressed,
    super.key,
  }) :  _onPressed = onPressed;

  final Function _onPressed;

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
            '포스트 저장하기',
            style: DesignerTextStyle.header3.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}