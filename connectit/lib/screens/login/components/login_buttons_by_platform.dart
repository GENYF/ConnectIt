import 'package:connectit/enums/sign_in_method.dart';
import 'package:connectit/screens/login/components/apple_login_button.dart';
import 'package:connectit/screens/login/components/google_login_button.dart';
import 'package:connectit/utils/design.dart';
import 'package:connectit/services/authentication_service.dart';

import 'package:flutter/material.dart';

/// on android platform, it shows only google signin
class LoginButtonsByPlatform extends StatelessWidget {
  LoginButtonsByPlatform({
    required this.hasAgreed,
    Key? key,
  }) : super(key: key);

  final bool hasAgreed;

  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    return Column(
      children: [
        GestureDetector(
          onTap: () => _onTappedGoogleLogin(context),
          child: const GoogleLoginButton(),
        ),
        const SizedBox(height: defaultSpacing),
        Visibility(
          visible: platform == TargetPlatform.iOS,
          child: GestureDetector(
            onTap: () => _onTappedAppleLogin(context),
            child: const AppleLoginButton(),
          ),
        ),
      ],
    );
  }

  void _onTappedGoogleLogin(BuildContext context) async {
    if (hasAgreed) {
      _handleSigningIn(context, signInMethod: SignInMethod.GOOGLE);
    } else {
      _showAgreementNeeded(context: context);
      return;
    }
  }

  void _onTappedAppleLogin(BuildContext context) async {
    if (hasAgreed) {
      _handleSigningIn(context, signInMethod: SignInMethod.APPLE);
    } else {
      _showAgreementNeeded(context: context);
    }
  }

  void _handleSigningIn(BuildContext context, {SignInMethod? signInMethod}) async {
    await _authenticationService.signIn(signInMethod: signInMethod);
  }

  void _showAgreementNeeded({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '로그인 실패',
            style: DesignerTextStyle.header1,
          ),
          content: Text('원활한 서비스 이용을 위해서는 서비스 이용약관과 개인정보 처리방침에 대한 동의가 필요합니다.', style: DesignerTextStyle.paragraph2),
          actions: <Widget>[
            ElevatedButton(
              child: Text('확인', style: DesignerTextStyle.caption1.apply(color: Colors.black87)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
