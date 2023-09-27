import 'package:connectit/utils/design.dart';
import 'package:flutter/material.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      constraints: const BoxConstraints(minHeight: 46),
      padding: const EdgeInsets.symmetric(vertical: defaultSpacingThreeQuarters),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logos/apple_white.png',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: defaultSpacingHalf),
          Text(
            'Apple로 계속하기',
            textAlign: TextAlign.center,
            style: DesignerTextStyle.header3.apply(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
