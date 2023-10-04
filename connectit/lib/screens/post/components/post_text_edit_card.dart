import 'package:flutter/material.dart';

import '../../../utils/design.dart';

class PostTextEditCard extends StatelessWidget {
  const PostTextEditCard({
    required TextEditingController textEditingController,
    required String hintText,
    int? maxLength,
    int? maxLines,
    super.key,
  }) :  _textEditingController = textEditingController,
        _hintText = hintText,
        _maxLength = maxLength,
        _maxLines = maxLines;

  final TextEditingController _textEditingController;
  final String _hintText;
  final int? _maxLength;
  final int? _maxLines;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _hintText,
          ),
          maxLength: _maxLength,
          maxLines: _maxLines,
        ),
      ),
    );
  }
}