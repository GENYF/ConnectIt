import 'package:flutter/material.dart';

import '../models/sns_ids.dart';
import '../utils/design.dart';
import 'sns_id_button.dart';

class SnsListWrap extends StatelessWidget {
  const SnsListWrap({
    super.key,
    required SnsIds snsIds,
  }) : _snsIds = snsIds;

  final SnsIds _snsIds;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: defaultSpacingHalf,
      runSpacing: defaultSpacingHalf,
      children: [
        Visibility(
          visible: _snsIds.kakaotalkId != null,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/kakaotalk.png',
            snsId: _snsIds.kakaotalkId!,
            onTap: () {},
          ),
        ),
        Visibility(
          visible: _snsIds.instagramId != null,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/instagram.png',
            snsId: _snsIds.instagramId!,
            onTap: () {},
          ),
        ),
        Visibility(
          visible: _snsIds.facebookId != null,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/facebook.png',
            snsId: _snsIds.facebookId!,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}