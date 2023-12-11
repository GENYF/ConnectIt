import 'package:connectit/screens/post/components/sns_id_text_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/design.dart';

// 포스트 작성 시 SNS ID를 입력하는 카드
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
            SnsIdTextField(
              textEditingController: _instagramIdController,
              snsLogoPath: 'assets/images/logos/instagram.png',
              hintText: 'Instagram ID를 적어주세요.',
            ),
            const SizedBox(height: defaultSpacing),
            SnsIdTextField(
              textEditingController: _facebookIdController,
              snsLogoPath: 'assets/images/logos/facebook.png',
              hintText: 'Facebook ID를 적어주세요.',
            ),
          ],
        ),
      ),
    );
  }
}