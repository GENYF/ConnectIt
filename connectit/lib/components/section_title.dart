import 'package:flutter/material.dart';

import '../utils/design.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required String title,
    required bool isAction,
    Function? onPressed,
    super.key,
  }) :  _title = title,
        _isEditable = isAction,
        _onPressed = onPressed;

  final String _title;
  final bool _isEditable;
  final Function? _onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_title, style: DesignerTextStyle.title1),
          Visibility(
            visible: _isEditable,
            child: IconButton(
              onPressed: () => _onPressed!(),
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.black87,
                size: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
