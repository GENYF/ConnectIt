import 'package:flutter/material.dart';

import '../../../utils/design.dart';

// 포스트 작성 시 SNS ID를 입력하는 커스텀 텍스트 필드
class SnsIdTextField extends StatelessWidget {
  const SnsIdTextField({
    super.key,
    required TextEditingController textEditingController,
    required String snsLogoPath,
    required String hintText,
  }) :  _textEditingController = textEditingController,
        _snsLogoPath = snsLogoPath,
        _hintText = hintText;

  final TextEditingController _textEditingController;
  final String _snsLogoPath;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(defaultSpacingHalf),
          child: Image.asset(_snsLogoPath, width: 16, height: 16),
        ),
        prefix: const Text('@'),
        border: const OutlineInputBorder(),
        hintText: _hintText,
      ),
    );
  }
}