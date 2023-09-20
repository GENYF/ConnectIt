import 'package:connectit/utils/design.dart';
import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      constraints: const BoxConstraints(minHeight: 46),
      padding: const EdgeInsets.symmetric(vertical: defaultSpacingThreeQuarters),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Colors.black12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logos/google.png',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: defaultSpacingHalf),
          Text(
            'Google로 계속하기',
            textAlign: TextAlign.center,
            style: DesignerTextStyle.header3.apply(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
