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
          visible: _snsIds.kakaotalk != null && _snsIds.kakaotalk!.isNotEmpty,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/kakaotalk.png',
            snsId: _snsIds.kakaotalk!,
            onTap: () {},
          ),
        ),
        Visibility(
          visible: _snsIds.instagram != null && _snsIds.instagram!.isNotEmpty,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/instagram.png',
            snsId: _snsIds.instagram!,
            onTap: () {},
          ),
        ),
        Visibility(
          visible: _snsIds.facebook != null && _snsIds.facebook!.isNotEmpty,
          child: SnsIdButton(
            snsLogoPath: 'assets/images/logos/facebook.png',
            snsId: _snsIds.facebook!,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}