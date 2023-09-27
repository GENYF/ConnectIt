import 'package:flutter/material.dart';

import '../utils/design.dart';

class SnsIdButton extends StatelessWidget {
  const SnsIdButton({
    required String snsLogoPath,
    required String snsId,
    required Function onTap,
    super.key,
  }) :  _snsLogoPath = snsLogoPath,
        _snsId = snsId,
        _onTap = onTap;

  final String _snsLogoPath;
  final String _snsId;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () => _onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultSpacingQuarter, horizontal: defaultSpacingHalf),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                _snsLogoPath,
                width: 20.0,
                height: 20.0,
              ),
              const SizedBox(width: defaultSpacingHalf),
              Text(
                '@$_snsId',
                style: DesignerTextStyle.paragraph2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}