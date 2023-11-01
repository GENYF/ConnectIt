import 'package:connectit/utils/design.dart';
import 'package:connectit/utils/logger.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SigningAgreementNotice extends StatefulWidget {
  const SigningAgreementNotice({
    required this.onTappedAgreementButton,
    required this.hasAgreed,
    Key? key,
  }) : super(key: key);

  final Function onTappedAgreementButton;
  final bool hasAgreed;

  @override
  State<SigningAgreementNotice> createState() => _SigningAgreementNoticeState();
}

class _SigningAgreementNoticeState extends State<SigningAgreementNotice> {
  bool _hasAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '이용약관',
                recognizer: TapGestureRecognizer()..onTap = () => _launchInBrowser('https://ey-labs.notion.site/ConnectIt-ae4a7ce6b5c84203be5dbb23064007f0?pvs=4'),
                style: DesignerTextStyle.caption1.apply(
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' 및 ',
                style: DesignerTextStyle.caption1,
              ),
              TextSpan(
                text: '개인정보 처리 방침 ',
                recognizer: TapGestureRecognizer()..onTap = () => _launchInBrowser('https://ey-labs.notion.site/ConnectIt-cfb3b40cea3f4c6591c801edf9b85ae2?pvs=4'),
                style: DesignerTextStyle.caption1.apply(
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: '에 동의합니다.',
                style: DesignerTextStyle.caption1,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => _onTappedAgreementButtonWrapper(),
          icon: _hasAgreed
              ? const Icon(
                  Icons.check_box,
                  color: Colors.black87,
                  size: 24,
                )
              : const Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                  size: 24,
                ),
        ),
      ],
    );
  }

  void _onTappedAgreementButtonWrapper() {
    setState(() {
      _hasAgreed = !_hasAgreed;
      widget.onTappedAgreementButton();
    });
  }

  Future<void> _launchInBrowser(String url) async {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      logger.e('[Launching in Browser] Failed');

      throw 'Could not launch $uri';
    }
  }
}
