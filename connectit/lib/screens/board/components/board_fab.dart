import 'package:flutter/material.dart';

import '../../../utils/design.dart';

class BoardFAB extends StatelessWidget {
  const BoardFAB({
    required Function onTap,
    super.key,
  }) : _onTap = onTap;

  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpacingHalf),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onTap(),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            child: Padding(
              padding: const EdgeInsets.all(defaultSpacingHalf),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add_outlined,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: defaultSpacingHalf),
                  Text(
                    '내 포스트잇 붙이기',
                    style: DesignerTextStyle.caption2.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}