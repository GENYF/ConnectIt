import 'package:flutter/material.dart';

import '../../../utils/design.dart';

class PostSnsIdsEditCard extends StatelessWidget {
  const PostSnsIdsEditCard({
    super.key,
    required TextEditingController kakaoTalkIdController,
    required TextEditingController instagramIdController,
    required TextEditingController facebookIdController,
  }) :  _kakaoTalkIdController = kakaoTalkIdController,
        _instagramIdController = instagramIdController,
        _facebookIdController = facebookIdController;

  final TextEditingController _kakaoTalkIdController;
  final TextEditingController _instagramIdController;
  final TextEditingController _facebookIdController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          children: [
            SnsIdTextField(
              textEditingController: _kakaoTalkIdController,
              snsLogoPath: 'assets/images/logos/kakaotalk.png',
              hintText: 'Kakaotalk ID를 적어주세요.',
            ),
            const SizedBox(height: defaultSpacing),
            TextField(
              controller: _instagramIdController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultSpacingHalf),
                  child: Image.asset('assets/images/logos/instagram.png', width: 16, height: 16),
                ),
                prefix: const Text('@'),
                border: const OutlineInputBorder(),
                hintText: 'Instagram ID를 적어주세요.',
              ),
            ),
            const SizedBox(height: defaultSpacing),
            TextField(
              controller: _facebookIdController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultSpacingHalf),
                  child: Image.asset('assets/images/logos/facebook.png', width: 16, height: 16),
                ),
                prefix: const Text('@'),
                border: const OutlineInputBorder(),
                hintText: 'Facebook ID를 적어주세요.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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